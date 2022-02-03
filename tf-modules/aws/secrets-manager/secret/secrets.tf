resource "aws_secretsmanager_secret" "custom" {
  name = var.sm-secret-name
  description = var.sm-secret-description
  kms_key_id = var.sm-secret-kms-key-id

  tags = {
    Name        = var.sm-secret-name
    Environment = var.environment
    Platform    = "Secrets Manager"
    Type        = "Secrets"
  }
}