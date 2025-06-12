terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "aziza-tfstate-20250607"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "rs_task_list"
  }
}

provider "aws" {
  region = var.region
}

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