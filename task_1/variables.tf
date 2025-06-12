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

variable "dynamodb_table" {
  description = "DynamoDB table for state locking"
  type        = string
  default     = "rs_task_list"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "Dev"
}
