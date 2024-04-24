#Configuration Block
terraform {
  required_version = ">= 1.8.1"
}


#Provider Block
provider "aws" {
  region = "ap-south-1"
}


#Data Block
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

data "aws_ami_ids" "ubuntu-1" {
  owners = ["905418199754", "amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/ubuntu-*-*-amd64-server-*"]
  }
}
data "aws_ec2_instance_type" "example" {
  instance_type = "t2.micro"
}


#Resource Block
resource "aws_instance" "block-data-instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

}

