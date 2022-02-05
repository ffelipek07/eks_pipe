variable "env" {
  description = "Environment Tag QA or PRD"
}

variable "region" {
  description = "Provider Region"
  type = string
}

variable "aws_account_id" {
  description = "AWS Account id (DEV:  STG:  PRD: )"
  type = string
}

variable "client" {
  type        = string
  description = "Client name"
}

# EKS
variable "eks_create_eks" {
    default     = 1
    description = "Conditional EKS creation"
}

variable "eks_cluster_version" {
    type        = string
    description = "Kubernetes Version"
    default     = "1.20"
}

variable "eks_node_groups" {
  type        = any
  description = "Map of map of node groups to create."
}

variable "eks_iam_dev_group_name" {
    type        = list(string)
    description = "IAM Dev group name for EKS permissions"
    default     = ["Dev"]
}
variable "eks_iam_admin_group_name" {
    type        = list(string)
    description = "IAM Admin group name for EKS permissions"
    default     = ["Administrator"]
}

variable "namespaces" {
  default = [
    "ingress-nginx",
    "development",
  ]
}

variable "helm-charts" {
  default = [
    {
      "name"       = "ingress-nginx",
      "repository" = "https://kubernetes.github.io/ingress-nginx",
      "chart"      = "ingress-nginx",
      "version"    = "4.0.13",
      "namespace"  = "ingress-nginx"
      "values"     = "./charts/nginx-ingress.yaml"
      "force"      = false
    }
    # {
    #   "name"       = "nifi",
    #   "repository" = "https://cetic.github.io/helm-charts",
    #   "chart"      = "nifi",
    #   "version"    = "0.6.4",
    #   "namespace"  = "development"
    #   "values"     = "./charts/nifi.yaml"
    # }
  ]
}