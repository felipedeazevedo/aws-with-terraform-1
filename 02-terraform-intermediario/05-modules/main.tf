terraform {
  required_version = "1.6.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}

provider "aws" {
  region  = "sa-east-1"
  profile = "terraform"
}

resource "random_pet" "this" {
  length = 5
}

module "bucket" {
  source = "./s3_module"
  name   = random_pet.this.id
  # Since the name is nome defined in variables, I have to defined
  # it here when creating a bucket with this module
}