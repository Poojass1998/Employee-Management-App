vpc_cidr = "10.0.0.0/16"
vpc_name = "ema_vpc"

public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
azs = ["ap-south-1a", "ap-south-1b"]

instance_type = "t2.micro"
ami_id = "ami-014e2b14bdb83e8ca"
key_name = "aws"

db_instance_name = "ema_db"
instance_class = "db.t3.micro"
allocated_storage = 20
db_subnet_group_name = "my-db-subnet-group"

db_username = "admin"
db_password = "poojards"
db_engine = "mysql"
db_engine_version = "8.0"
db_parameter_group_name = "default.mysql8.0"
skip_final_snapshot = true

bucket_name = "ema-s3-bucket"

dynamodb_table_name = "terraform-lock"
dynamodb_hash_key = "LockID"

iam_role_name = "ema-iam-role"
iam_policy_name = "ema-iam-policy"
