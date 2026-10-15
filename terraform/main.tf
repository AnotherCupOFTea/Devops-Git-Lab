terraform {
  required_version = ">= 1.4.0"
}

locals {
  project_name = var.app_name
  environment  = var.environment
  app_port     = var.container_port
}

output "project_name" {
  description = "Configured project name"
  value       = local.project_name
}

output "environment" {
  description = "Configured environment"
  value       = local.environment
}

output "container_port" {
  description = "Configured application port"
  value       = local.app_port
}