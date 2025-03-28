module "vpc" {
  source          = "./modules/vpc"
  vpc_cidr        = var.vpc_cidr
  vpc_name        = var.vpc_name
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}

module "ec2" {
  source                 = "./modules/ec2"
  instance_type          = var.instance_type
  ami_id                 = var.ami_id
  key_name               = var.key_name
  subnet_id              = module.vpc.public_subnet_ids[0]
  vpc_security_group_ids = [module.ec2.ec2_sg_id]
  instance_name          = "my-ec2-instance"
  vpc_id        = module.vpc.vpc_id
}

module "rds" {
  source                  = "./modules/rds"
  db_instance_name        = var.db_instance_name
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  db_subnet_group_name    = var.db_subnet_group_name
  db_subnet_ids           = module.vpc.private_subnet_ids
  db_username             = var.db_username
  db_password             = var.db_password
  db_engine               = var.db_engine
  db_engine_version       = var.db_engine_version
  vpc_security_group_ids  = [module.rds.rds_sg_id]
  db_parameter_group_name = var.db_parameter_group_name
  skip_final_snapshot     = var.skip_final_snapshot
  vpc_id                  = module.vpc.vpc_id
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}

module "iam" {
  source              = "./modules/iam"
  role_name           = var.iam_role_name
  assume_role_service = "ec2.amazonaws.com"
  policy_name         = var.iam_policy_name
  policy_document     = file("iam_policy.json")
  
}

module "jenkins" {
  source                 = "./modules/Jenkins"
  ami_id                 = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = module.vpc.public_subnet_ids[0]
  vpc_id                 = module.vpc.vpc_id
  vpc_security_group_ids = [module.jenkins.jenkins_sg_id]
}
