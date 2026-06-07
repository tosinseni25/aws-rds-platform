variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Short name used to prefix all resource names"
  type        = string
  default     = "rds-platform"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}
