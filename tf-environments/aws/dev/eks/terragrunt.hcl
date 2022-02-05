include {
  path = "${find_in_parent_folders()}"
}

terraform {
  source = "../../../..//tf-blueprints/aws/eks"
}

inputs = {
  client                   = "stackdevops"
  eks_cluster_version      = "1.21"
  eks_iam_dev_group_name   = ["Developer"]
  eks_iam_admin_group_name = ["Administrator"]
  eks_node_groups          = {
      dev_node_group = {
        name_prefix      = "cluster-eks"
        desired_capacity = 1
        max_capacity     = 1
        min_capacity     = 1

        instance_types = ["t3a.small"]
        capacity_type  = "ON_DEMAND"
      }
  }
}