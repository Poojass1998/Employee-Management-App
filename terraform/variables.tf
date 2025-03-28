# VPC Variables
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}

# EC2 Variables
variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "key_name" {
  description = "Key pair name for EC2 access"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs for instances"
  type        = list(string)
}

# RDS Variables
variable "db_instance_name" {
  description = "Database instance name"
  type        = string
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "allocated_storage" {
  description = "Allocated storage for RDS in GB"
  type        = number
}

variable "db_subnet_group_name" {
  description = "DB subnet group name"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "db_engine" {
  description = "Database engine (e.g., MySQL, PostgreSQL)"
  type        = string
}

variable "db_engine_version" {
  description = "Database engine version"
  type        = string
}

variable "db_parameter_group_name" {
  description = "Database parameter group name"
  type        = string
}

variable "skip_final_snapshot" {
  description = "Whether to skip final snapshot before deletion"
  type        = bool
}

# S3 Variables
variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "versioning_enabled" {
  description = "Enable versioning for S3 bucket"
  type        = bool
  default     = false
}

# IAM Variables
variable "iam_role_name" {
  description = "IAM role name"
  type        = string
}

variable "iam_policy_name" {
  description = "IAM policy name"
  type        = string
}

# Jenkins Variables
variable "jenkins_instance_type" {
  description = "Instance type for Jenkins server"
  type        = string
}

variable "jenkins_ami_id" {
  description = "AMI ID for Jenkins server"
  type        = string
}

variable "jenkins_key_name" {
  description = "Key pair name for Jenkins server"
  type        = string
}

variable "jenkins_security_group_ids" {
  description = "List of security groups for Jenkins server"
  type        = list(string)
}
