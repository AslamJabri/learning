terraform {
  required_version = ">=1.8.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.46.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.0.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.5.0"
    }
  }
}