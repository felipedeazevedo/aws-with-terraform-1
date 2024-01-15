terraform {
  required_version = "1.6.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}

resource "null_resource" "null" {
  triggers = {
    timestamp = timestamp()
  }

  provisioner "local-exec" { # We can run more than one command at once
    command = "echo $FOO $BAR $BAZ $TIME >> env_vars.txt"

    environment = {
      FOO = "bar"
      BAR = 1
      BAZ = "true"
      TIME = timestamp()
    }
  }

  provisioner "local-exec" { # We can run more than one command at once
    command = "rm -rf nodejs-app && mkdir nodejs-app && cd nodejs-app && npm init -y && npm install joi"
  }
}
