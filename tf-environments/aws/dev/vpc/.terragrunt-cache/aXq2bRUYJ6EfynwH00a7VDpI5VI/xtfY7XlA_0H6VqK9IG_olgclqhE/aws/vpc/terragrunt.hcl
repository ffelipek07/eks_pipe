include {
  path = "${find_in_parent_folders()}"
}

terraform {
  source  = "../../../../tf-blueprints//aws/vpc"
}

inputs = {
  client                   = "stackdata"

}

