output "db_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = aws_db_instance.db.endpoint
}

output "rds_id" {
  description = "The RDS instance ID"
  value       = aws_db_instance.db.id
}

output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
}
