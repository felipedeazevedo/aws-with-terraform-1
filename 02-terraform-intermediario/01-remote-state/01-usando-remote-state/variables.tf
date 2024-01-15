variable "aws_region" {
  type        = string
  description = ""
  default     = "sa-east-1"
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "terraform"
}

variable "ami" {
  type        = string
  description = ""
  default     = "ami-01c1b05f1b398fb4b"
}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t2.micro"
}
