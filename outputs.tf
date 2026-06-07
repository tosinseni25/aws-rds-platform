output "aws_region" {
  description = "Region resources are deployed into"
  value       = var.aws_region
}

output "project_name" {
  description = "Project name used to prefix resources"
  value       = var.project_name
}

output "environment" {
  description = "Deployment environment"
  value       = var.environment
}