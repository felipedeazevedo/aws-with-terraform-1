resource "aws_instance" "server" {
  count = local.instance_number <= 0 ? 0 : local.instance_number # Controlar a qtd de recursos que criaremos desse tipo. Quantas aws instance queremos criar com esse bloco

  ami           = var.instance_ami
  instance_type = lookup(var.instance_type, var.env) #Retorna o tipo de instancias de acordo com o env que eu passar

  tags = merge( # Mergeia um ou mais variáveis do tipo map ou object
    local.common_tags,
    {
      Project = "Curso AWS com Terraform"
      Env     = format("%s", var.env)                  # É um printf que temos em C
      Name    = format("Instance %d", count.index + 1) # count.index retorna em qual iteração está, aí soma-se mais 1 para se tiver na iteração 0 visualizarmos como 1
    }
  )
}
