module "vpc" {
  source          = "./modules/vpc"
  vpc_cidr       = var.vpc_cidr
  vpc_name       = var.vpc_name
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs            = var.azs
}

module "ec2" {
  source             = "./modules/ec2"
  instance_type      = var.instance_type
  ami_id             = var.ami_id
  key_name           = var.key_name
  subnet_id          = module.vpc.public_subnet_ids[0]
  security_groups    = [module.vpc.default_sg_id]
  instance_name      = "my-ec2-instance"
}

module "rds" {
  source                = "./modules/rds"
  db_instance_name      = var.db_instance_name
  instance_class        = var.instance_class
  allocated_storage     = var.allocated_storage
  db_subnet_group_name  = var.db_subnet_group_name
  db_username           = var.db_username
  db_password           = var.db_password
  db_engine             = var.db_engine
  db_engine_version     = var.db_engine_version
  vpc_security_group_ids = [module.vpc.default_sg_id]
  db_parameter_group_name  = var.db_parameter_group_name
  skip_final_snapshot   = var.skip_final_snapshot
}

module "s3" {
  source       = "./modules/s3"
  bucket_name  = var.bucket_name
}

module "dynamodb" {
  source       = "./modules/dynamodb"
  table_name   = var.dynamodb_table_name
  hash_key     = var.dynamodb_hash_key
  hash_key_type = "S"
}

module "iam" {
  source              = "./modules/iam"
  role_name           = var.iam_role_name
  assume_role_service = "ec2.amazonaws.com"
  policy_name         = var.iam_policy_name
  policy_document     = file("iam_policy.json")
}

module "jenkins" {
  source             = "./modules/Jenkins"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  subnet_id          = module.vpc.public_subnet_ids[0]
  security_group_ids = [module.vpc.default_sg_id]
  vpc_id             = module.vpc.vpc_id
}
