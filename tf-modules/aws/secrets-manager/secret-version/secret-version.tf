
resource "aws_secretsmanager_secret_version" "custom" {
  secret_id     = var.smv-secret-id
  secret_string = jsonencode(var.smv-secret-string)
}