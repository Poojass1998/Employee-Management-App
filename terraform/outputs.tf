output "vpc_id" {
  value = module.vpc.vpc_id
}
output "ec2_public_ip" {
  value = module.ec2.instance_public_ip
}
output "rds_endpoint" {
  value = module.rds.db_endpoint
}
output "s3_bucket_name" {
  value = module.s3.bucket_name
}
output "iam_role_arn" {
  value = module.iam.role_arn
}
output "jenkins_public_ip" {
  value = module.jenkins.jenkins_public_ip
}
