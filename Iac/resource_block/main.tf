provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "new-s3-bucket" {
  bucket = "com-${random_id.randomness.hex}"
  tags = {
    Name = "com-${random_id.randomness.hex}"
  }
}
resource "aws_s3_bucket_ownership_controls" "new-s3-bucket-ownership" {
  bucket = aws_s3_bucket.new-s3-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_acl" "new-s3-bucket-acl" {
    depends_on = [ aws_s3_bucket_ownership_controls.new-s3-bucket-ownership ]
  bucket = aws_s3_bucket.new-s3-bucket.id
  acl    = "private"
}
resource "aws_security_group" "Webserver" {
    name = "Web Server inbound"
    description = "Allow 80 and 443"
    ingress {
        description = "80"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
    tags = {
        Name = "terraform created this"
    }
}
resource "random_id" "randomness" {
  byte_length = 12
}