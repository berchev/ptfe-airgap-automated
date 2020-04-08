

resource "aws_s3_bucket" "tfe_bucket" {
  bucket = var.bucket_name

  tags = {
    Name = var.aws_s3_bucket_tfe_bucket_tag_name


  }
}

resource "aws_s3_bucket_public_access_block" "tfe_bucket_permissions" {
  bucket = aws_s3_bucket.tfe_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}