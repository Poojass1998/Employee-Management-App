variable "ami_id" {
  description = "AMI ID for Jenkins EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for Jenkins instance"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of security groups for Jenkins instance"
  type        = list(string)
}
