output "jenkins_public_ip" {
  description = "Public IP of the Jenkins server"
  value       = aws_instance.jenkins.public_ip
}

output "jenkins_security_group_id" {
  description = "Security group ID for Jenkins"
  value       = aws_security_group.jenkins_sg.id
}
