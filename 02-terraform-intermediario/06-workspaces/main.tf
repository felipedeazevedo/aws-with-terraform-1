terraform {
  required_version = "1.6.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }

  backend "s3" {
    bucket         = "tfstate-064206072911"
    key            = "05-workspaces/terraform.tfstate"
    region         = "sa-east-1"
    profile        = "terraform"
    dynamodb_table = "tflock-tfstate-064206072911" # Locking table
  }
}

provider "aws" {
  region  = lookup(var.aws_region, local.env)
  profile = "terraform"
}

locals {
  env = terraform.workspace == "default" ? "dev" : terraform.workspace
}

resource "aws_instance" "web" {
  count = lookup(var.instance, local.env)["number"]

  ami           = lookup(var.instance, local.env)["ami"]
  instance_type = lookup(var.instance, local.env)["type"]

  tags = {
    Name = "Minha máquina web ${local.env}"
    Env  = local.env
  }
}
