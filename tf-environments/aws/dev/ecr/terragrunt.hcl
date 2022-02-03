include {
  path = "${find_in_parent_folders()}"
}

terraform {
  source = "../tf-modules//aws/ecr"
}

inputs = {
  client                                = "resource"
  registry_list                         = ["appweb"]

}