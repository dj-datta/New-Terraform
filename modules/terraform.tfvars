ami_id = "ami-01376101673c89611"
instance_type   = "t2.micro"
key_name = "tf-key"
vpc_cidr_block = "10.0.0.0/16"
subnet_cidr_block = [ "10.0.1.0/24", "10.0.2.0/24" ]
az = [ "ap-south-1a", "ap-south-1b"  ]
public_ip = true
