variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "devops-infrastructure"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "development"
}

variable "container_port" {
  description = "Application container port"
  type        = number
  default     = 80
}