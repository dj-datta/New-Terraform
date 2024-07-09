resource "aws_vpc" "vnet" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "module-demo"
  }

}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.vnet.id
  cidr_block              = var.subnet_cidr_block[0]
  availability_zone       = var.az[0]
  map_public_ip_on_launch = var.public_ip
  tags = {
    Name = "Public-Subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vnet.id
  tags = {
    Name = "igw-demo"
  }
}

resource "aws_route_table" "rt-pub" {
  vpc_id = aws_vpc.vnet.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Rt-Public"
  }
}

resource "aws_route_table_association" "attach" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.rt-pub.id

}
