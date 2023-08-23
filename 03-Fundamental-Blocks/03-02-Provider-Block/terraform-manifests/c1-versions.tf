# Terraform Block
terraform {
  required_version = ">= 0.13.1"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.3.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.10"
    }
  }
}

# Provider Block
provider "aws" {
  region = "us-east-1"  
  profile = "default" 
}

/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/
