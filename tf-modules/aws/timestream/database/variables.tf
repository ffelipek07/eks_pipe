variable "environment" {
  default = "development"
}

variable "database_name" {
  description = "Database name to be provisioned"
  type        = string
}

variable "kms_key_arn" {
  description = "KMS custom key ARN for encryption"
  type        = string
  default     = null
}