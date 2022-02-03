output "id" {
    value = aws_appautoscaling_target.custom.id
}

output "scalable_dimension" {
    value = aws_appautoscaling_target.custom.scalable_dimension
}

output "service_namespace" {
    value = aws_appautoscaling_target.custom.service_namespace
}