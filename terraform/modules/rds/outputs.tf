output "rds_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = aws_db_instance.db.endpoint
}

output "rds_id" {
  description = "The RDS instance ID"
  value       = aws_db_instance.db.id
}