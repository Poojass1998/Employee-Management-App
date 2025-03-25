resource "aws_db_instance" "db" {
  allocated_storage      = var.allocated_storage
  engine                = var.db_engine
  engine_version        = var.db_engine_version
  instance_class        = var.instance_class
  db_name               = var.db_instance_name
  username              = var.db_username
  password              = var.db_password
  parameter_group_name  = var.db_parameter_group_name
  skip_final_snapshot   = var.skip_final_snapshot
  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = var.db_subnet_group_name
}