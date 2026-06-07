output "kms_key_arn" {
  description = "ARN of the RDS KMS key"
  value       = aws_kms_key.rds.arn
}

output "db_secret_arn" {
  description = "ARN of the database credentials secret"
  value       = aws_secretsmanager_secret.db_credentials.arn
}

output "rds_monitoring_role_arn" {
  description = "ARN of the RDS enhanced monitoring role"
  value       = aws_iam_role.rds_monitoring.arn
}