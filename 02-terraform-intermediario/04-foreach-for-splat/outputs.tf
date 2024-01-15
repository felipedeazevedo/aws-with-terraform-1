output "extensions" {
  value = local.file_extensions
}

output "instance_arns" {
  value = [for k, v in aws_instance.this : v.arn]
}

output "instance_names" {
  value = { for k, v in aws_instance.this : k => v.tags.Name } # Extrai chave e valor do aws_instance.this
}

output "extensions_upper" {
  value = local.file_extensions_upper
}

output "private_ips" {
  value = [for o in local.ips : o.private]
}

output "public_ips" {
  value = local.ips[*].public
}