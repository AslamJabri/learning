terraform {
  required_version = ">= 1.8.0"  
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.46.0"
    }
  }
}

### Provider Block

provider "aws" {
  region = "us-east-1"
  #hardcode it
  access_key = "alulacn"
  secret_key = "asbc ,jac ,c"

  # or using env variable in CLI
  #export AWS_ACCESS_KEY = "ejbclcnjclc"
  #export AWS_SECRET_ACCESS_KEY = "ejvcslvn lsvnlsvkn"

  # or using a shared file
  shared_credentials_files = "user/desktop/cred.txt"
  profile = "aj-east-1"
}