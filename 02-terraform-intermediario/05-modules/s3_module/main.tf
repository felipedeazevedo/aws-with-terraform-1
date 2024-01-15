resource "aws_s3_bucket" "this" {
  bucket = var.name
  tags   = var.tags
}

resource "aws_s3_bucket_website_configuration" "config" {
  bucket = aws_s3_bucket.this.id

  redirect_all_requests_to {
    host_name = lookup(aws_s3_bucket_website_configuration.config.redirect_all_requests_to, "redirect_all_requests_to", null)
  }

  index_document {
    suffix = lookup(aws_s3_bucket_website_configuration.config.index_document, "index_document", null)
  }

  error_document {
    key = lookup(aws_s3_bucket_website_configuration.config.error_document, "error_document", null)
  }

  routing_rules = lookup(aws_s3_bucket_website_configuration.config.routing_rules, "rounting_rules", null)
}
