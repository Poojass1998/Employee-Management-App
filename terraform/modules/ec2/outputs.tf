output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "Public IP address of the instance"
  value       = aws_instance.web.public_ip
  sensitive   = true
}

output "private_ip" {
  description = "Private IP address of the instance"
  value       = aws_instance.web.private_ip
}
