#data block
data "aws_region" "current" {}
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
  owners = ["amazon"]
}


#variable Block



#resource block
#Here we will create the VPC and subnets
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}
resource "aws_default_subnet" "default_az1" {
  availability_zone = "ap-south-1a"

  tags = {
    Name = "Default subnet for ap-south-1a"
  }
}
#creating the Security Groups
resource "aws_security_group" "SSH" {
  name        = "SSH"
  description = "Allow ssh from everywer"
  vpc_id      = aws_default_vpc.default
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "Web" {
  name        = "SSH"
  description = "Allow ssh from everywer"
  vpc_id      = aws_default_vpc.default
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
#In this block we have created the SSH-key
resource "tls_private_key" "new_key" {
  algorithm = "RSA"
}
resource "local_file" "tls_private_key" {
  content  = tls_private_key.new_key.private_key_openssh
  filename = "Mynewenv.pem"
}
resource "aws_key_pair" "new_aws_key" {
  public_key = tls_private_key.new_key.public_key_openssh
  key_name   = "Mynewenv.pem"
  
  tags = {
    name = "My terraform key"
  }
  lifecycle {
    ignore_changes = [key_name]
  }
}

#Here we will create the EC2
resource "aws_instance" "Ubuntu-Ec2" {
  ami             = data.aws_ami.ubuntu
  subnet_id       = aws_default_subnet.default_az1
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.new_aws_key.key_name
  security_groups = [aws_security_group.SSH.id, aws_security_group.Web.id]
  associate_public_ip_address = true
  connection {
    user = "ubuntu"
    private_key = tls_private_key.new_key.private_key_pem
    host = self.public_ip
  }
  lifecycle {
    ignore_changes = [ security_groups ]
  }
  provisioner "local-exec" {
    command = "chmod 600 ${local_file.private_key_pem.Mynewenv.pem}"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo rm -rf /tmp",
      "sudo git clone https://github.com/hashicorp/demo-terraform-101 /tmp",
      "sudo sh /tmp/assets/setup-web.sh",
    ]
  }
}



#output block

output "current" {
  value = data.aws_region.current
}
output "new_aws_key" {
  value     = aws_key_pair.new_aws_key.id
  sensitive = true
}