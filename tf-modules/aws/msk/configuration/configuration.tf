resource "aws_msk_configuration" "custom" {
  name           = var.msk-configuration-name
  kafka_versions = var.msk-configuration-version
  server_properties = var.msk-configuration-properties
}