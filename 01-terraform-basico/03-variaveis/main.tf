terraform {
  required_version = "1.6.6" # Locking version to avoid issues

  required_providers {
    aws = {
      source  = "hashicorp/aws" #Oficial provider
      version = "5.31.0"        # Locking version to avoid issues
    }
  }
}


provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile # Defined in config files
}

resource "aws_instance" "web" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  tags = var.instance_tags
}