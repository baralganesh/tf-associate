
# Provider Block
provider "aws" {
  region = "us-east-1"  
  # profile = "default" 
  profile = "sandbox"
}

/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/