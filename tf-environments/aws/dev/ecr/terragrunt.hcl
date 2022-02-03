include {
  path = "${find_in_parent_folders()}"
}

terraform {
  source = "../../../..//tf-blueprints/aws/ecr"
}

inputs = {
  client                                = "stackdevops"
  registry_list                         = ["appweb"]

}