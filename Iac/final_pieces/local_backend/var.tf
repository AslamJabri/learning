data "aws_region" "current" {}
data "aws_availability_zones" "available" {
  state = "available"
}
data "aws_vpc" "default" {}


data "aws_ami" "web-server" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon"]
}





#Variables
variable "common_tags" {
  type = map(string)
  default = {
    "provisioner" = "Terraform"
    "department"  = "development"
    "env"         = "testing"
  }
}
