include {
  path = "${find_in_parent_folders()}"
}

terraform {
  source  = "../../../..//tf-blueprints/aws/s3"
}

inputs = {
  client                   = "appweb"
}

