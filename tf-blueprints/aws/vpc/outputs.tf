#############
# VPC Module
#############

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

# Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}




output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "database_subnets" {
  description = "List of IDs of database subnets"
  value       = module.vpc.database_subnets
}

output "elasticache_subnets" {
  description = "List of IDs of elasticache subnets"
  value       = module.vpc.elasticache_subnets
}

output "redshift_subnets" {
  description = "List of IDs of redshift subnets"
  value       = module.vpc.redshift_subnets
}

output "intra_subnets" {
  description = "List of IDs of intra subnets"
  value       = module.vpc.intra_subnets
}

# NAT gateways
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc.nat_public_ips
}

# Customer Gateway
output "cgw_ids" {
  description = "List of IDs of Customer Gateway"
  value       = module.vpc.cgw_ids
}

output "this_customer_gateway" {
  description = "Map of Customer Gateway attributes"
  value       = module.vpc.this_customer_gateway
}

# CIDR blocks
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

# Database Subnet Name
output "database_subnet_group_name" {
  description = "Database Subnet Group Name"
  value       = module.vpc.database_subnet_group_name

} 

output "private_route_table_ids" {
  value = module.vpc.private_route_table_ids
  description = "List of IDs of private route tables"
}