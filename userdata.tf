# User_Data Example 1
resource "aws_instance" "vm" {
  ami           = "ami-01376101673c89611"
  instance_type = "t2.micro"
  key_name      = "tf-key"
  user_data = <<-EOF
  #!/bin/bash
  sudo -i
  yum update -y
  yum install httpd -y
  systemctl start httpd 
  systemctl enable httpd
  echo "Apache-Server Demo" >/var/www/html/index.html

  EOF


  tags = {
    Name = "Apache-Server"
  }
}

---
# User_Data Example 2
resource "aws_instance" "vm" {
  ami           = "ami-01376101673c89611"
  instance_type = "t2.micro"
  key_name      = "tf-key"
  user_data = file("script.sh")
  tags = {
    Name = "HTTPD-Server"
  }
}

output "public_ip" {
  value = aws_instance.vm.public_ip
  
}

output "public_ip" {
  value = aws_instance.vm.public_ip
  
}
