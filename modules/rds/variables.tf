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

variable "private_subnet_ids" {
  description = "IDs of private subnets for RDS"
  type        = list(string)
}

variable "rds_security_group_id" {
  description = "ID of the RDS security group"
  type        = string
}

variable "kms_key_arn" {
  description = "ARN of the KMS key for encryption"
  type        = string
}

variable "monitoring_role_arn" {
  description = "ARN of the RDS enhanced monitoring IAM role"
  type        = string
}
