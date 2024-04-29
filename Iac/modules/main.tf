terraform {
  required_version = "~> 1.8.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.46" 
    }
  }
}
provider "aws" {
  region = "ap-south-1"
}
data "aws_vpc" "default"{}

data "aws_subnet" "default"{
    vpc_id = data.aws_vpc.default.id
    availability_zone = "ap-south-1a"
}
data "aws_ami" "ubuntu-new"{
    filter{
        name = "name"
        values = [ "ubuntu-pro-server/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-pro-server-*" ]
    }
    filter {
      name = "virtualization-type"
      values = [ "hvm" ]
    }
    owners = [ "amazon","self" ]
}

resource "aws_security_group" "Webserver" {
  vpc_id = data.aws_vpc.default.id
  name = "Webserver SG"
  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    to_port = 22
    from_port = 22
    protocol = "tcp"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    to_port = 80
    from_port = 80
    protocol = "tcp"
  }
  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    to_port = 0
    from_port = 0
    protocol = -1
  }
}

module "ubuntu-web" {
  source = "./server"
  ami = data.aws_ami.ubuntu-new.id
  security_group = aws_security_group.Webserver.id
  subnetid = data.aws_subnet.default.id
}
output "public-ip"{
    value = module.ubuntu-web.public_ip
}
