terraform {
  required_version = "~> 1.8.0"
  backend "remote"{
    hostname = "app.terraform.io"
    organization = "terra-prac"
    workspaces {
      name = "practise"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.46.0"
    }
  }
}