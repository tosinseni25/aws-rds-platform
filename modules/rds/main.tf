resource "aws_db_subnet_group" "main" {
  name        = "${var.project_name}-${var.environment}-subnet-group"
  description = "Subnet group for Aurora PostgreSQL cluster"
  subnet_ids  = var.private_subnet_ids

  tags = {
    Name = "${var.project_name}-${var.environment}-subnet-group"
  }
}
resource "aws_rds_cluster" "main" {
  cluster_identifier      = "${var.project_name}-${var.environment}-cluster"
  engine                  = "aurora-postgresql"
  engine_version          = "16.6"
  database_name           = "appdb"
  master_username         = "dbadmin"
  master_password         = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.main.name
  vpc_security_group_ids  = [var.rds_security_group_id]
  storage_encrypted       = true
  kms_key_id              = var.kms_key_arn
  backup_retention_period = 7
  preferred_backup_window = "03:00-04:00"
  deletion_protection     = false
  skip_final_snapshot     = true

  tags = {
    Name = "${var.project_name}-${var.environment}-cluster"
  }
}
resource "aws_rds_cluster_instance" "main" {
  identifier          = "${var.project_name}-${var.environment}-instance"
  cluster_identifier  = aws_rds_cluster.main.id
  instance_class      = "db.t3.medium"
  engine              = aws_rds_cluster.main.engine
  engine_version      = aws_rds_cluster.main.engine_version
  publicly_accessible = false

  monitoring_interval = 60
  monitoring_role_arn = var.monitoring_role_arn

  performance_insights_enabled    = true
  performance_insights_kms_key_id = var.kms_key_arn

  tags = {
    Name = "${var.project_name}-${var.environment}-instance"
  }
}

