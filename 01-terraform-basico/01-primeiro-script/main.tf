terraform {
  required_version = "1.6.6" # Locking version to avoid issues

  required_providers {
    aws = {
      source = "hashicorp/aws" #Oficial provider
      version = "5.31.0" # Locking version to avoid issues
    }
  }
}


provider "aws" {
  region = "sa-east-1"
  profile = "terraform" # Defined in config files
}

resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "my-tf-test-bucket-curso-terraform" # This name has to be unique

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Managedby = "Terraform"
  }
}