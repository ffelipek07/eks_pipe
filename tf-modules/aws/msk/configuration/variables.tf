variable "msk-configuration-name" {
  default = ""
}

variable "msk-configuration-version" {
  type = set(string)
  default = [""]
}

variable "msk-configuration-properties" {
  default = <<PROPERTIES
  ""
  PROPERTIES
}

