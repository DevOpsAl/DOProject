provider "aws" {
  region  = var.myregion
  access_key  = var.dpaccess_key
  secret_key  = var.dpsecret_key
}

resource "aws_vpc" "myvpc1" {
  cidr_block  = "10.0.0.0/16"
  tags  = {
    Name  = var.vpcname
  }
}

resource "aws_internet_gateway" "myigw1" {
  vpc_id  = aws_vpc.myvpc1.id
  tags  = {
    Name  = "dpigw"
  }
}

resource "aws_subnet" "mysubnet1" {
  vpc_id  = aws_vpc.myvpc1.id
  map_public_ip_on_launch  = true
  cidr_block  = "10.0.0.0/16"
  tags  = {
    Name  = "dpsub1"
  }
}

resource "aws_route_table" "myroute1" {
  vpc_id  = aws_vpc.myvpc1.id
  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id  = aws_internet_gateway.myigw1.id
  }
}

resource "aws_route_table_association" "myrw_association" {
  subnet_id  = aws_subnet.mysubnet1.id
  route_table_id  = aws_route_table.myroute1.id
}