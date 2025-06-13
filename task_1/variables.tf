variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "S3 bucket name for Terraform state"
  type        = string
  default     = "aziza-tfstate-20250607"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "Dev"
}
