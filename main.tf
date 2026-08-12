# Configure the AWS Provider
provider "aws" {
  region  = "eu-west-2"
}
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/20"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "Vaultpay-vpc"
    Project = "Vaultpay"
  }
}