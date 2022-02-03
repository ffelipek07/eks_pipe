variable "environment" {
  default = "development"
}

variable "database_name" {
  description = "Database name to create table in"
  type        = string
}

variable "table_name" {
  description = "Table name"
  type        = string
}

variable "magnetic_store_retention_period_in_days" {
  description = "The duration for which data must be stored in the magnetic store"
  type        = number
  default     = 73000
}

variable "memory_store_retention_period_in_hours" {
  description = "The duration for which data must be stored in the memory store"
  type        = number
  default     = 6
}