provider "aws" {
  region = "ap-south-1"
}

locals {
  team        = "api_management_dev"
  application = "corp_api"
  server_name = "ec2-${var.environment}-api-${var.availability_zone}"
}

resource "aws_vpc" "vpc-1" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
}

resource "aws_subnet" "variable-subnet" {
  vpc_id            = aws_vpc.vpc-1.id
  cidr_block        = var.sub_cidr
  availability_zone = var.availability_zone
  tags = {
    Name      = "sub-variables-${var.availability_zone}"
    Terraform = "true"
  }
}

resource "aws_instance" "Ec2-instance" {
  ami           = "ami-007020fd9c84e18c7"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.variable-subnet.id
  tags = {
    Name  = local.server_name
    Owner = local.team
    app   = local.application
  }

}
