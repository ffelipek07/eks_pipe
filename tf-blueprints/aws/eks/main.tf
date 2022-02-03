provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "tfstate-${var.env}-${var.aws_account_id}"
    key    = "eks/terraform.tfstate"
    region = var.region
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config  = {
    bucket = "tfstate-${var.env}-${var.aws_account_id}"
    key    = "vpc/terraform.tfstate"
    region = var.region
  }
}

# EKS

data "aws_eks_cluster" "cluster" {
  name  = module.default_aws_eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name  = module.default_aws_eks.cluster_id
}

data "aws_caller_identity" "current" {}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

module "default_aws_eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "17.24.0"
  cluster_name                                   = "${var.client}-${var.env}-eks"
  cluster_version                                = var.eks_cluster_version
  subnets                                        = data.terraform_remote_state.vpc.outputs.private_subnets
  vpc_id                                         = data.terraform_remote_state.vpc.outputs.vpc_id
  node_groups                                    = var.eks_node_groups
  manage_aws_auth                                = true
  cluster_endpoint_private_access                = false
  cluster_endpoint_public_access                 = true
  cluster_create_endpoint_private_access_sg_rule = false
  workers_additional_policies	                   = ["arn:aws:iam::aws:policy/CloudWatchLogsFullAccess","arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"]
  map_roles                                      = [
    {
      rolearn  = aws_iam_role.k8sadmin_role.arn
      username = "admin"
      groups   = ["system:masters"]
    },
    {
      rolearn  = aws_iam_role.k8sdev_role.arn
      username = "dev"
      groups   = ["system:bootstrappers", "system:nodes", ]
    }
  ]
  map_users  = [
    {
      userarn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/pipeline-tf-${var.env}"
      username = "pipeline-tf-${var.env}"
      groups   = ["system:masters"]
    }
  ]

  tags = {
    Environment = var.env,
    Name = "eks-${var.env}",
    terraform = true
  }
}

resource "aws_iam_role" "k8sadmin_role" {
  name = "${var.env}-eks-admin"

  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
      },
    ]
  })
  depends_on = [kubernetes_namespace.custom]
  tags = {
    Environment = var.env
  }
}

resource "aws_iam_role" "k8sdev_role" {
  name               = "${var.env}-eks-dev"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Sid       = ""
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
      },
    ]
  })
  depends_on = [kubernetes_namespace.custom]
  tags = {
    Environment = var.env
  }
}

resource "aws_iam_policy" "iam_policy_dev_group" {
  name        = "${var.env}AllowAssumeOrganizationAccountRoleDev"
  description = "AllowAssumeOrganizationAccountRole"

  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action   = "sts:AssumeRole"
        Effect   = "Allow"
        Sid      = ""
        Resource = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.env}-eks-dev"
      },
    ]
  })
}

resource "aws_iam_group_policy_attachment" "iam-policy-attach-dev-group" {
  for_each   = toset(var.eks_iam_dev_group_name)
  group      = each.value
  policy_arn = aws_iam_policy.iam_policy_dev_group.arn
}

resource "aws_iam_policy" "iam_policy_admin_group" {
  name        = "${var.env}AllowAssumeOrganizationAccountRoleAdmin"
  description = "AllowAssumeOrganizationAccountRole"

  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action   = "sts:AssumeRole"
        Effect   = "Allow"
        Sid      = ""
        Resource = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.env}-eks-admin"
      },
    ]
  })
}

resource "aws_iam_group_policy_attachment" "iam-policy-attach-admin-group" {
  for_each   = toset(var.eks_iam_admin_group_name)
  group      = each.value
  policy_arn = aws_iam_policy.iam_policy_admin_group.arn
}

# NGINX-INGRESS HELM CHARTs
provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}

resource "kubernetes_namespace" "custom" {
  for_each = toset(var.namespaces)

  metadata {
    name = each.key
  }
}

resource "helm_release" "custom" {
  for_each = { for chart in var.helm-charts : chart.name => chart }

  name         = each.value.name
  repository   = each.value.repository
  chart        = each.value.chart
  version      = each.value.version
  namespace    = each.value.namespace
  force_update = each.value.force
  values = [
    file(each.value.values)
  ]
  depends_on = [module.default_aws_eks, kubernetes_namespace.custom]
}
