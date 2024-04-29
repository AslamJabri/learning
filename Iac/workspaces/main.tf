provider "aws" {
  region = "ap-south-1"
}


data "aws_vpc" "default" {
}
data "aws_availability_zone" "default"{
    state = "available"
    name = "ap-south-1a"
}
data "aws_ami" "ubuntu-server-pro"{
    filter {
      name = "name"
      values = ["ubuntu-pro-server/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-pro-server-*"]
    }
    filter {
      name = "virtualization-type"
      values = ["hvm"]

    }
}


output "vpc-id"{
    value = data.aws_vpc.default.id
}
output "instance-ami-id" {
    value = data.aws_ami.ubuntu-server-pro.id
}


resource "aws_security_group" "New_security" {
  vpc_id = data.aws_vpc.default.id
  name = "New Webserver"
  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }
  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 80
    to_port = 80
    protocol = "tcp"
  } 
  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }
  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 22
    to_port = 22
    protocol = "tcp"

  } 
}
resource "aws_default_subnet" "default-subnet" {
  availability_zone = data.aws_availability_zone.default.id
}

resource "aws_instance" "ubuntu-pro" {
  ami = data.aws_ami.ubuntu-server-pro.id
  subnet_id = aws_default_subnet.default-subnet.id
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.New_security.id ]
  associate_public_ip_address = true
  connection {
    user = "ubuntu"
    host = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [ 
        
        "sudo apt install apache2",
        "sudo systemctl enable apache2",
        "sudo systemctl start apache2"
     ]
  }
}
