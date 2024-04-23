provider "aws" {
  region = "ap-south-1"
}
resource "aws_vpc" "vpc-1" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
}
resource "aws_subnet" "variable-subnet" {
  vpc_id = aws_vpc.vpc-1.id
  cidr_block = var.sub_cidr
  availability_zone = var.availability_zone
  tags = {
    Name = "sub-variables-${var.availability_zone}"
    Terraform = "true"
  }
}