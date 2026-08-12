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