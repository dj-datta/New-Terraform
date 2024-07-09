module "ec2" {
    source = "./ec2"
    ami_id = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
  
}

module "vpc" {
  source = "./vpc"
  vpc_cidr_block = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
  az = var.az
  public_ip = var.public_ip
}
