variable "ami" {
  description = "AMI ID for Ubuntu"
  default     = "ami-0c2b8ca1dad447f8a" 
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH key pair name"
  default     = "koya13"
}
