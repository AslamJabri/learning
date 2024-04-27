terraform {
  required_version = "~> 1.8.0 "
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.46.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.100.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
  }
}