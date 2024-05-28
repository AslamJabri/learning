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
    filter {
      name   = "virtualization-type"
      values = ["hvm"]
    }
    sort_ascending = true
    
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
data "aws_security_groups" "ansible-sg"{
  tags = {
    "name" = "ansible"
  }
}
