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
#ECR
variable "registry_list" {
  description = "The registry from which to retrieve the list of packages."
  type        = list(string)
  default     = []
}



# variable "aim_broker_user" {
#   description = "aim broker user"
#   type        = string
# }
# variable "aim_broker_group" {
#   description = "aim broker group"
#   type        = string
# }