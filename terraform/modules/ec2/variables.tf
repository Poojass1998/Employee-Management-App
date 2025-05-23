variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be launched"
  type        = string
}

variable "associate_public_ip" {
  description = "Associate a public IP with the instance"
  type        = bool
  default     = false
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of security groups for EC2 instance"
  type        = list(string)
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}
variable "vpc_id" {
  description = "VPC ID"
}
