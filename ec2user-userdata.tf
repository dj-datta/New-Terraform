provider "aws" {
    region = "us-east-1"
    profile = "tf-user"
}

resource "aws_instance" "vm" {
    ami = "ami-06c68f701d8090592"
    instance_type = "t2.micro"
    key_name = "eks"
    vpc_security_group_ids = [aws_security_group.sg.id]
  
    tags = {
        Name = "Mauli"
    }
    user_data = <<-EOF
    #!/bin/bash
    sudo -i
    yum update -y
    yum install httpd -y
    systemctl start httpd 
    systemctl enable httpd
    echo "Coming Soon" >/var/www/html/index.html

     EOF 
}
resource "aws_security_group" "sg" {
    name = "tera-sg"
    vpc_id = "vpc-00fec84796c1a8c7a"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

  

 output "public_ip" {
    value = aws_instance.vm.public_ip
 }