resource "aws_timestreamwrite_database" "custom" {
  database_name = var.database_name
  kms_key_id    = var.kms_key_arn

  tags = {
    Name = var.database_name
    Environment = var.environment
  }
}