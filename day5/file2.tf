# create vpc, 2 subnets, internet gateway, in default route table (route internet gatewat with subnet)
provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "myVPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "myVPC"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.myVPC.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "subnet-1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.myVPC.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "subnet-2"
  }
}

resource "aws_internet_gateway" "myIGW" {
  vpc_id = aws_vpc.myVPC.id
  tags = {
    Name = "myIGW"
  }
}

resource "aws_default_route_table" "default_route_table" {
  default_route_table_id = aws_vpc.myVPC.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myIGW.id
  }
}

resource "aws_route_table_association" "subnet1_assoc" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_default_route_table.default_route_table.id
}