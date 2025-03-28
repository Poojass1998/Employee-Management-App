output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.vpc.vpc_id
}
output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "db_endpoint" {
  description = "Database endpoint URL"
  value       = module.rds.db_endpoint
}

output "s3_bucket_name" {
  description = "Name of the created S3 bucket"
  value       = module.s3.bucket_name
}

output "iam_role_arn" {
  description = "IAM Role ARN"
  value       = module.iam.role_arn
}

output "jenkins_public_ip" {
  description = "Public IP of the Jenkins server"
  value       = module.jenkins.jenkins_public_ip
}
