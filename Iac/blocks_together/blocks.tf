#provider block we will need three required libraries block for this project AWS,LOCAL,and TLS
terraform {
  required_version = ">= 1.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.46.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.5.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.0.5"
    }
  }
}
#This block is specific to the library which we want. its a provider block.In this we can also give creds.
provider "aws" {
  region = "ap-south-1"
}
# Since i Have to use the vpc in multiple places i will make use of variable block

variable "aws_vpc" {
  type = string
  default = "192.168.0.0/20"
}
variable "aws_subnet_private" {
  type = string
  default = "192.168.2.0/24"
}
variable "aws_subnet_public" {
  type = string
  default = "192.168.1.0/24"
  
}


#data variable 
data "aws_region" "current" {}
data "aws_availability_zones" "available" {
  state = "available"
}
#Local Variable
locals {
  owner = "Terraform"
}
data "aws_ami" "myec2"{
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  owners = [ "amazon" ]
}
#output block
output "az" {
  value = data.aws_availability_zones.available
  description = "We are in this az"
}
output "reg" {
  value = data.aws_region.current
  description = "This is the choosen region"
}
output "myec2-instance"{
  value = data.aws_ami.myec2.id
  description = "Ubuntu ids"
}
output "aws_vpc"{
  value = var.aws_vpc
  description = "This is the vpc"
}
output "public_ip"{
  value = aws_instance.ubuntu-server.public_ip
}

#lets create the new VPC in that ap-south-1 region
resource "aws_vpc" "terraform_created-vpc" {
  cidr_block       = var.aws_vpc
  instance_tenancy = "default"
  tags = {
    Name       = "terra_creation"
    department = "Prod"
    owner = local.owner
  }
}
resource "aws_subnet" "Public" {
  vpc_id            = aws_vpc.terraform_created-vpc.id
  cidr_block        = var.aws_subnet_public
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "Public_subnet"
    owner = local.owner
  }
}
resource "aws_subnet" "Private" {
  vpc_id            = aws_vpc.terraform_created-vpc.id
  cidr_block        = var.aws_subnet_private
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "Private_subnet"
    owner = local.owner
  }
}
resource "aws_internet_gateway" "terra-IGW" {
  vpc_id = aws_vpc.terraform_created-vpc.id
  tags = {
    Name = "Terraform-IGW"
    owner = local.owner
  }
}
# resource "aws_internet_gateway_attachment" "IGW-attachment" {
#   internet_gateway_id = aws_internet_gateway.terra-IGW.id
#   vpc_id              = aws_vpc.terraform_created-vpc.id
# }
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.terraform_created-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terra-IGW.id
  }
  tags = {
    Name = "Public_route"
    owner = local.owner
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.terraform_created-vpc.id
  tags = {
    Name = "Private Route"
    owner = local.owner
  }
}
resource "aws_route_table_association" "association-private" {
  subnet_id      = aws_subnet.Private.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "association-public" {
  subnet_id      = aws_subnet.Public.id
  route_table_id = aws_route_table.public.id
}
resource "aws_security_group" "web-server" {
  name = "Web-server"
  vpc_id = aws_vpc.terraform_created-vpc.id
  description = "This is a web server security group"
  
  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }
  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }
  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    to_port = 0
    protocol = -1
  }
  lifecycle {
    create_before_destroy = true
  }

}

resource "tls_private_key" "generate" {
  algorithm = "RSA"
}
resource "local_file" "private_key_pem" {
  content = tls_private_key.generate.private_key_pem
  filename = "NewKey.pem"
}
resource "local_file" "public_key" {
  content = tls_private_key.generate.public_key_openssh
  filename = "NewKey.pub"
}
resource "aws_key_pair" "newKey" {
  key_name = local_file.private_key_pem.filename
  public_key = local_file.public_key.content
}

resource "aws_instance" "ubuntu-server" {
  ami = data.aws_ami.myec2.id
  availability_zone = data.aws_availability_zones.available.names[1]
  subnet_id = aws_subnet.Public.id
  key_name = aws_key_pair.newKey.id
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.web-server.id ]
  associate_public_ip_address = true
  tags = {
    "name" = local.owner
  }
  connection {
    user = "ubuntu"
    private_key = tls_private_key.generate.private_key_pem
    host = self.public_ip
  }
  provisioner "local-exec" {
    command = "chmod 600 ${local_file.private_key_pem.filename}"
  }
  provisioner "remote-exec" {
    inline = [ 
      "sudo apt update",
      "sudo apt install apache2 -y",
      "sudo systemctl enable apache2",
      "sudo systemctl start apache2"
     ]
  }

}