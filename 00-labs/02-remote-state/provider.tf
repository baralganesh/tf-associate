# Terraform Block
terraform {
  required_version = ">= 0.13.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.3.0"
    }
  }

# Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terraform-gbaralsolutions"
    key    = "dev/terraform.tfstate"
    region = "us-east-1" 
    dynamodb_table = "terraform-dev-state-table" 
    # Primary key set as LockID      
  }
}

# Provider Block
provider "aws" {
  region = "us-east-1"
  # profile = "default" 
  profile = "default"
}
