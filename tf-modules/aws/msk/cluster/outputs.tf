output "cluster-arn" {
  value = aws_msk_cluster.custom.arn
}

output "bootstrap_brokers_sasl_scram" {
  value = aws_msk_cluster.custom.bootstrap_brokers_sasl_scram
}

output "zookeeper_connect_string" {
  value = aws_msk_cluster.custom.zookeeper_connect_string
}

output "bootstrap_brokers_tls" {
  description = "TLS connection host:port pairs"
  value       = aws_msk_cluster.custom.bootstrap_brokers_tls
}