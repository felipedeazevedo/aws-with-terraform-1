locals {
  instance_number = lookup(var.instance_number, var.env) #Retorna o num de instancias de acordo com o env que eu passar

  file_ext    = "zip"
  object_name = "meu-arquivo-gerado-de-um-template"

  common_tags = {
    "Owner" = "Felipe Azevedo"
    "Year"  = "2024"
  }
}
