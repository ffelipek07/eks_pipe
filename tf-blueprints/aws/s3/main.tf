provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "tfstate-${var.env}-${var.aws_account_id}"
    key    = "s3/terraform.tfstate"
    region = var.region
  }
}


#S3 BUCKET

module "s3-app" {
  source = "../../../tf-modules/aws/s3"
  #source  = "terraform-aws-modules/s3-bucket/aws"
  #version = "2.9.0"

  bucket = "${var.env}-${var.client}"
  acl    = "private"

  # block_public_acls       = true
  # block_public_policy     = true
  # ignore_public_acls      = true
  # restrict_public_buckets = true
  

}



