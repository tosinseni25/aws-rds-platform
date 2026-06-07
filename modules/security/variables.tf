variable "project_name" {
  description = "Short name used to prefix all resource names"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "db_password" {
  description = "Master password for RDS cluster"
  type        = string
  sensitive   = true
}
