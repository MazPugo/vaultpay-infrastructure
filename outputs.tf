output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.vpc.public_subnet_ids
}

output "app_private_subnet_ids" {
  description = "IDs of the app private subnets"
  value       = module.vpc.app_private_subnet_ids
}

output "db_private_subnet_ids" {
  description = "IDs of the database private subnets"
  value       = module.vpc.db_private_subnet_ids
}