##Provider Block Example
#Best practice never to hardcode the key into terraform file
provider "aws" {
    access_key = "jafvsecbkjnc"
    secret_key = "ejbvcsjnclsnc"
    region = "us-east-1"
}

#resource block
resource "aws_instance" "web" {
    ami = "ami-sndlasdnl"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_subnets["public_subnets_1"].id
    vpc_security_group_ids = [ "sg-sahbckjascn" ]
    tags = {
      "terraform" =  "true"
    }
}