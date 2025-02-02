variable "region" {
  description = "The AWS region to deploy in"
  type        = string
  default     = "us-east-1"
}

variable "db_name" {
  default = "finance"
}

variable "db_user" {
  sensitive = true
}

variable "db_password" {
  sensitive = true
}

variable "private_subnet_port" {
  description = "AWS Private Subnet Open Port"
  default = 443
}

variable "public_subnet_port" {
  description = "AWS Public Subnet Open Port"
  default = 8080
}

variable "sns_servicename" {
  default = "com.amazonaws.us-east-1.sns"
}

variable "sns_email" {
  description = "SNS email subscription"
  sensitive = true
}