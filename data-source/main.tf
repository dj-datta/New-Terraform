data "aws_ami" "web" {
  most_recent = true
  owners = ["137112412989"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.5.20240701.0-kernel-6.1-x86_64"]
  }


  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

resource "aws_instance" "vm" {
  ami = data.aws_ami.web.id
  instance_type = "t3.micro"

  tags = {
    Name = "Data-Example"
  }
}

output "ami" {
  value = aws_instance.vm.id
}
