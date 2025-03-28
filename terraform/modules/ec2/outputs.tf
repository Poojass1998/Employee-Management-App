output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.web.id
}
output "public_ip" {
  value = aws_instance.web.public_ip
}
output "private_ip" {
  value = aws_instance.web.private_ip
}
output "ec2_sg_id" {
  value = aws_security_group.ec2_sg.id
}
