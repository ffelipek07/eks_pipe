resource "aws_secretsmanager_secret_policy" "custom" {
  secret_arn = var.sm-secret-arn
  policy     = var.sm-policy
}