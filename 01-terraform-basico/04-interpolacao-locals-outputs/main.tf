terraform {
  required_version = "1.6.6" # Locking version to avoid issues

  required_providers {
    aws = {
      source  = "hashicorp/aws" #Oficial provider
      version = "5.31.0"        # Locking version to avoid issues
    }
    random = {
      source  = "hashicorp/random" #Oficial provider
      version = "3.6.0"            # Locking version to avoid issues
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
