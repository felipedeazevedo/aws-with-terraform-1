data "template_file" "json" {
  template = file("template.json.tpl")

  vars = {
    age    = 21
    eye    = "Brown"
    name   = "Felipe"
    gender = "Male"
  }
}

data "archive_file" "json" { # Pega o arquivo, o conteúdo, e converte pro tipo que eu desejar
  type        = local.file_ext
  output_path = "${path.module}/files/${local.object_name}.${local.file_ext}" # Onde vai salvar na minha máquina
  # path.module - caminho onde estou executando esse script - 02-builtin-functions/files...

  source {
    content  = data.template_file.json.rendered
    filename = "${local.object_name}.json"
  }
}
