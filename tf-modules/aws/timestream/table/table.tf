resource "aws_timestreamwrite_table" "custom" {
  database_name = var.database_name
  table_name    = var.table_name

  dynamic "retention_properties" {
    for_each = var.magnetic_store_retention_period_in_days != null && var.memory_store_retention_period_in_hours != null ? {
      magnetic_store_retention_period_in_days = var.magnetic_store_retention_period_in_days
      memory_store_retention_period_in_hours = var.memory_store_retention_period_in_hours
    } : {}

    content {
      magnetic_store_retention_period_in_days = var.magnetic_store_retention_period_in_days
      memory_store_retention_period_in_hours  = var.memory_store_retention_period_in_hours
    }
  }

  tags = {
    Name = var.database_name
    Environment = var.environment
  }
}