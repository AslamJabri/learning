

resource "tls_private_key" "keypair" {
  algorithm = "RSA"
}
resource "local_file" "private_key" {
  content  = tls_private_key.keypair.private_key_pem
  filename = "new_terra.pem"
}
resource "local_file" "public_key" {
  content  = tls_private_key.keypair.public_key_openssh
  filename = "new_terra.pub"
}
resource "aws_key_pair" "aws_keypair" {
  key_name   = local_file.private_key.filename
  public_key = local_file.public_key.content
  tags = {
    name = local_file.private_key.filename
  }
  tags_all = var.common_tags
}
resource "aws_s3_bucket" "terra_auth" {
  bucket = "terra-auth-backend"
  tags   = var.common_tags
}
resource "aws_s3_bucket_ownership_controls" "terra_auth_ownership" {
  bucket = aws_s3_bucket.terra_auth.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_acl" "terra_auth_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.terra_auth_ownership]
  bucket     = aws_s3_bucket.terra_auth.id
  acl        = "private"
}

resource "aws_security_group" "New-SG" {
  name        = "Security-group-ssh-http"
  description = "New Security group for ssh and http"
  vpc_id      = data.aws_vpc.default.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "ubuntu-server" {
  ami                         = data.aws_ami.web-server.id
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.aws_keypair.key_name
  associate_public_ip_address = true
  availability_zone           = data.aws_availability_zones.available.names[0]
  vpc_security_group_ids = [ aws_security_group.New-SG.id ]
  tags                        = var.common_tags
  source_dest_check = false
  provisioner "local-exec" {
    command = "chmod 600 ${local_file.private_key.filename}"
  }
  connection {
    user        = "ubuntu"
    host        = self.public_ip
    private_key = tls_private_key.keypair.private_key_pem
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt install apache2 -y",
      "sudo systemctl start apache2",
      "sudo systemctl enable apache2"
    ]
  }



}

