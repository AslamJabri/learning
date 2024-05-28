data "aws_region" "current" {}
data "aws_availability_zone" "Az" {
  name = "ap-south-1a"
}
data "aws_ami_ids" "ubuntu"{
    owners = [ "amazon" ]
    filter {
      name   = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
    }
}
data "aws_key_pair" "existing-key"{
    key_name = "vprofile-prod-key"
}
data "aws_vpc" "selected"{}

data "aws_subnets" "subnets-ids"{
    filter {
        name = "vpc-id"
        values = [ data.aws_vpc.selected.id ]
    }
}


data "aws_subnet" "subnet-loop" {
  for_each = toset(data.aws_subnets.subnets-ids.ids)
  id       = each.value
}


resource "aws_instance" "web-01" {
  ami = data.aws_ami_ids.ubuntu.id
  instance_type = "t2.micro"
  key_name = data.aws_key_pair.existing-key.key_name
  associate_public_ip_address = true
  subnet_id = data.aws_availability_zone.Az.id
}