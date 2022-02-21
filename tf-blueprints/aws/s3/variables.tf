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
