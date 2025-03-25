resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  associate_public_ip_address = var.associate_public_ip
  key_name               = var.key_name
  vpc_security_group_ids = var.security_groups  # Corrected attribute

  tags = {
    Name = var.instance_name
  }
}
