variable "env" {
  description = "Environment Tag QA or PRD"
}

variable "region" {
  description = "Provider Region"
  type = string
}

variable "aws_account_id" {
  description = "AWS Account id (DEV: 121144830179 STG: 337300427493 PRD: 394532677288)"
  type = string
}

variable "client" {
  type        = string
  description = "Client name"
}
