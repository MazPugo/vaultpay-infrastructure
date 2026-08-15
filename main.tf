# Configure the AWS Provider
provider "aws" {
  region  = "eu-west-2"
}
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/20"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name    = "Vaultpay-vpc"
    Project = "Vaultpay"
  }
}
resource "aws_subnet" "public_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidrs[0]
  availability_zone = "eu-west-2a"

  tags = {
    Name = "vaultpay-public-subnet-a"
    Project = "VaultPay"
  }
}
resource "aws_subnet" "public_b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidrs[1]
  availability_zone = "eu-west-2b"

  tags = {
    Name = "vaultpay-public-subnet-b"
    Project = "VaultPay"
  }
}
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name    = "vaultpay-igw"
    Project = "VaultPay"
  }
}
resource "aws_route_table" "public" {
  vpc_id =aws_vpc.main.id

  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "vaultpay-public-rt"
    Project = "VaultPay"
  }   
}

resource "aws_route_table_association" "public_a" {
  subnet_id           = aws_subnet.public_a.id
  route_table_id      = aws_route_table.public.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id           = aws_subnet.public_b.id
  route_table_id      = aws_route_table.public.id
}