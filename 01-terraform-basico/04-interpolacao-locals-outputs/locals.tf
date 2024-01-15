locals {
  ip_file_path = "ips.json"
  common_tags = {
    Service     = "Curso Terraform"
    Environment = "Dev"
    Managedby   = "Terraform"
    Owner       = "Felipe Azevedo"
  }
  content_type = "application/json"
}