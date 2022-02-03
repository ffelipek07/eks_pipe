resource "aws_appautoscaling_policy" "custom" {
  name               = var.scaling_policy_name
  policy_type        = var.scaling_policy_type
  resource_id        = var.scaling_policy_resource_id
  scalable_dimension = var.scaling_policy_scalable_dimension
  service_namespace  = var.scaling_policy_service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = var.scaling_policy_predefined_metric_type
    }

    target_value = var.scaling_policy_target_value
  }
}