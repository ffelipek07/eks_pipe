variable "environment" {
  default = ""
}

variable "msk-cluster-name" {
    default = ""
}

variable "msk-kafka-version" {
    default = "2.6.1"
}

variable "msk-number-of-brokers" {
    default = 2
}

variable "msk-configuration-arn" {
    default = ""
}

variable "msk-configuration-latest_revision" {
    default = 0
}

variable "msk-instance-type" {
    default = "kafka.t3.small"
}

variable "msk-ebs-volume-size" {
    default = 100
}

variable "msk-client-subnets" {
    type    = list(string)
    default = [""]
}

variable "msk-security-groups" {
    type    = list(string)
    default = [""]
}

variable "msk-sasl-scram" {
    default = false
}

variable "msk-sasl-iam" {
    default = true
}


variable "msk-encript-client-broker" {
    default = "TLS"
}

variable "msk-certificate-authority-arn" {
    type = string
    default = ""
}

variable "msk-encrypt-in-cluster" {
    default = true
}

variable "msk-encript-at-rest-kms-key" {
    default = ""
}

variable "msk-enhanced-monitoring" {
  default = ""
}

variable "msk-enable-jmx-exporter" {
    default = true
}

variable "msk-enable-node-exporter" {
    default = true
}