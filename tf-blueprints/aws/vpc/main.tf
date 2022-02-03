provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "tfstate-${var.env}-${var.aws_account_id}"
    key    = "vpc/terraform.tfstate"
    region = var.region
  }
}


#############
# VPC Module
#############


module "vpc" {
  source = "../../../tf-modules/aws/vpc"

  name = var.client
  cidr = var.vpc_cidr

  azs                 = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets     = var.private_subnets_ips
  public_subnets      = var.public_subnets_ips
  database_subnets    = var.database_subnets_ips


  manage_default_route_table = true
  default_route_table_tags   = { 
    Name = "default-route-table-${var.env}"
    DefaultRouteTable = true
    Owner       = var.client
    Environment = var.env
    Terraform   = "true"
    Account     = var.aws_account_id
  } 

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_classiclink             = true
  enable_classiclink_dns_support = true

  single_nat_gateway = true

  enable_nat_gateway = true
  
  #VPN
  enable_vpn_gateway = true
  propagate_private_route_tables_vgw = true

  #DHCP
  enable_dhcp_options              = false

  # Default security group - ingress/egress rules cleared to deny all
  manage_default_security_group  = true
  default_security_group_ingress = []
  default_security_group_egress  = []

  # VPC Flow Logs (Cloudwatch log group and IAM role will be created)
  enable_flow_log                      = true
  create_flow_log_cloudwatch_log_group = true
  create_flow_log_cloudwatch_iam_role  = true
  flow_log_max_aggregation_interval    = 60

  public_subnet_tags = {
    Name = "subnet-public-${var.env}"
    Owner       = var.client
    Environment = var.env
    Terraform   = "true"
    Account     = var.aws_account_id
  }

  private_subnet_tags = {
    Name = "subnet-private-${var.env}"
    Owner       = var.client
    Environment = var.env
    Terraform   = "true"
    Account     = var.aws_account_id
  }

  database_subnet_tags = {
    Name = "subnet-database-private-${var.env}"
    Owner       = var.client
    Environment = var.env
    Terraform   = "true"
    Account     = var.aws_account_id
  }


  vpn_gateway_tags = {
    Name = "vpn-gateway-${var.env}"
    Owner       = var.client
    Environment = var.env
    Terraform   = "true"
    Account     = var.aws_account_id
  }

  vpc_tags = {
    Name = "vpc-projeto-${var.env}"
    Owner       = var.client
    Environment = var.env
    Terraform   = "true"
    Account     = var.aws_account_id
  }

  tags = {
    Owner       = var.client
    Environment = var.env
    Terraform   = "true"
    Account     = var.aws_account_id
  }
}
