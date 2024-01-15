resource "aws_instance" "web" {
  ami           = data.aws_ami.linux.id
  instance_type = var.instance_type
}
