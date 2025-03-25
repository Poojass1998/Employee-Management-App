variable "allocated_storage" {
  description = "The allocated storage in GB"
  type        = number
}

variable "db_engine" {
  description = "The database engine to use"
  type        = string
}

variable "db_engine_version" {
  description = "The engine version to use"
  type        = string
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "db_instance_name" {
  description = "The database name"
  type        = string
}

variable "db_username" {
  description = "The master username for the database"
  type        = string
}

variable "db_password" {
  description = "The master password for the database"
  type        = string
  sensitive   = true
}

variable "db_parameter_group_name" {
  description = "The name of the DB parameter group"
  type        = string
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot before deletion"
  type        = bool
  default     = true
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs"
  type        = list(string)
}

variable "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
}
