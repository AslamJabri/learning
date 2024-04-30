provider "aws" {
  region = "ap-south-1"
}
module "s3_bucket" {
  source                   = "terraform-aws-modules/s3-bucket/aws"
  bucket                   = "terra-auth-backend"
  acl                      = "private"
  control_object_ownership = true
  object_ownership         = "ObjectWriter"
}
