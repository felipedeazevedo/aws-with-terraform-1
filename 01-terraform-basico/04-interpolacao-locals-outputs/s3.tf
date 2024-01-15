resource "aws_s3_bucket" "this" {
  bucket = "${random_pet.bucket.id}-${var.environment}" # This name has to be unique

  tags = local.common_tags
}

resource "aws_s3_object" "this" {
  bucket       = aws_s3_bucket.this.bucket
  key          = "config/${local.ip_file_path}" # Onde eu quero salvar o arquivo dentro do bucket
  source       = local.ip_file_path             # Onde tá o arquivo, aqui no caso na raiz, no mesmo nível que meu código do terraform
  etag         = filemd5(local.ip_file_path)    # Identifica quando o arquivo foi alterado pra saber quando subir novamente no bucket
  content_type = local.content_type
  tags         = local.common_tags
}

resource "aws_s3_object" "random" {
  bucket       = aws_s3_bucket.this.bucket
  key          = "config/${random_pet.bucket.id}.json" # Onde eu quero salvar o arquivo dentro do bucket
  source       = local.ip_file_path                    # Onde tá o arquivo, aqui no caso na raiz, no mesmo nível que meu código do terraform
  etag         = filemd5(local.ip_file_path)           # Identifica quando o arquivo foi alterado pra saber quando subir novamente no bucket
  tags         = local.common_tags
  content_type = local.content_type
}

resource "aws_s3_bucket" "manual" {
  bucket = "meubucketcriadonocursodeterraform"

  tags = {
    Criado    = "01/01/2024"
    Importado = "03/01/2024"
    ManagedBy = "Terraform"
  }
}