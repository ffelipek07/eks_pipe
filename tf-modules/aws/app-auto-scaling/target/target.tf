resource "aws_appautoscaling_target" "custom" {
  max_capacity       = var.scaling_target_max_capacity
  min_capacity       = var.scaling_target_min_capacity
  resource_id        = var.scaling_target_resource_id
  scalable_dimension = var.scaling_target_scalable_dimension
  service_namespace  = var.scaling_target_service_namespace
}