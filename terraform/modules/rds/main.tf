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
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name        = var.db_subnet_group_name
  description = "Database subnet group"
  subnet_ids  = var.db_subnet_ids
  tags = {
    Name = var.db_subnet_group_name
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Allow MySQL inbound traffic"
  vpc_id = var.vpc_id 

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict this to your VPC CIDR
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
