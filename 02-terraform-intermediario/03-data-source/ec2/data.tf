data "aws_ami" "linux" {
  owners      = ["amazon"]
  most_recent = true
  name_regex  = "linux"
}
