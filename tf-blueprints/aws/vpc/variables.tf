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

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "172.22.16.0/20"
}


variable "private_subnets_ips" {
  description = "Private subnets ips"
  type        = list(string)
  default     = ["172.22.16.0/24", "172.22.17.0/24", "172.22.18.0/24"]
}


variable "public_subnets_ips" {
  description = "Public subnets ips"
  type        = list(string)
  default     = ["172.22.19.0/24", "172.22.20.0/24", "172.22.21.0/24"]
}

variable "database_subnets_ips" {
  description = "Database subnets ips"
  type        = list(string)
  default     = ["172.22.22.0/24", "172.22.23.0/24", "172.22.24.0/24"]
}

