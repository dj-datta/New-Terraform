provider "aws" {
    region = "us-east-1"
    profile = "tf-user"
}

 resource "aws_instance" "demo" {
    ami = "ami-01b799c439fd5516a"
    instance_type = "t2.micro"

    tags = {
        Name = "Shiv"
    }
 }
