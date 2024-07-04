provider "aws" {
    region = "us-east-1"
    profile = "tf-user"
}

resource "aws_vpc" "virtualcloud" {
    cidr_block = "192.168.0.0/24"
    tags = {
        Name = "my-tf-vpc"
    }     
}
resource "aws_subnet"  "public" {
    vpc_id = aws_vpc.virtualcloud.id
    cidr_block = "192.168.0.0/22"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true 

    tags = {
        Name = "pub-sub"
    }
}
resource "aws_subnet" "private" {
    vpc_id = aws_vpc.virtualcloud.id
    cidr_block = "192.168.1.0/24"
    availability_zone = "us-east-1b"

    tags = {
        Name = "pri-sub"
    }
}
resource "aws_internet_gateway" "internet"{
    vpc_id = aws_vpc.virtualcloud.id

    tags = {
        Name = "igw"
    }

}
resource "aws_route_table" "pub-rt" {
    vpc_id = aws_vpc.virtualcloud.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet.id
    }
    tags = {
             Name = "public-route"
    }
}
resource "aws_route_table_association" "a" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.pub-rt.id
}
resource "aws_eip" "ei"{
    domain = "vpc"
}
resource "aws_nat_gateway" "nat"{
    allocation_id = aws_eip.ei.id
    subnet_id = aws_subnet.public.id

     tags = {
        Name = "nat-gw"
     }
}
resource "aws_route_table" "pri-rt" {
    vpc_id = aws_vpc.virtualcloud.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.nat.id
    }
    tags = {
             Name = "private-route"
    }
}
resource "aws_route_table_association" "b" {
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.pri-rt.id
    }

output "vpc_id" {
  value = aws_vpc.virtualcloud.id

}
  