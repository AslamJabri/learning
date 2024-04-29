variable "ami" {}
variable "security_group" {}
variable "subnetid" {}

resource "aws_instance" "webserver" {
  ami = var.ami
  instance_type = "t2.micro"
  subnet_id = var.subnetid
  security_groups = [ var.security_group ]
  tags={
    name = "created by modules"
  }
}
output "public_ip"{
    value = aws_instance.webserver.public_ip
}
output "dns_id"{
    value = aws_instance.webserver.public_dns
}