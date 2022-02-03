include {
  path = "${find_in_parent_folders()}"
}

terraform {
  source  = "../tf-modules//aws/s3"
}

inputs = {
  client                   = "appweb"
}

