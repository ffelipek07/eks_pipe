include {
  path = "${find_in_parent_folders()}"
}

terraform {
  source = "../tf-modules//aws/eks"
}

inputs = {
  client                   = "stackdata"
  eks_cluster_version      = "1.21"
  eks_iam_dev_group_name   = ["Developer"]
  eks_iam_admin_group_name = ["Administrator"]
  eks_node_groups          = {
      dev_node_group = {
        name_prefix      = "cluster-eks"
        desired_capacity = 2
        max_capacity     = 2
        min_capacity     = 2

        instance_types = ["t3a.large"]
        capacity_type  = "ON_DEMAND"
      }
  }
}