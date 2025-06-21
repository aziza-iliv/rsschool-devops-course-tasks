resource "aws_s3_bucket" "aziza_test_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "Terraform State Bucket"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.aziza_test_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}