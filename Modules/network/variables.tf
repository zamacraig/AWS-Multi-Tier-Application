variable "vpc_cidr" {
    description = "AWS VPC CIDR"
    default = "10.0.0.0/16"
}

variable "vpc_name" {
    description = "AWS VPC Name Tag"
}

variable "vpc_zone_1" {
  description = "AWS Availability Zone 1"
  default = "us-east-1a"
}

variable "vpc_zone_2" {
  description = "AWS Availability Zone 2"
  default = "us-east-1b"
}

variable "public_finance_subnet_a_cidr" {
  description = "AWS Public Subnet A CIDR"
  default = "10.0.1.0/28"
}

variable "public_finance_subnet_b_cidr" {
  description = "AWS Public Subnet B CIDR"
  default = "10.0.2.0/28"
}

variable "private_finance_subnet_a_cidr" {
  description = "AWS Private Subnet A CIDR"
  default = "10.0.3.0/28"
}

variable "private_finance_subnet_b_cidr" {
  description = "AWS Private Subnet A CIDR"
  default = "10.0.4.0/28"
}

variable "internet_cidr" {
  description = "AWS Internet CIDR"
  default = "0.0.0.0/0"
}

variable "private_subnet_port" {
  description = "AWS Private Subnet Open Port"
}

variable "public_subnet_port" {
  description = "AWS Public Subnet Open Port"
}

variable "sns_servicename" {
  default = "com.amazonaws.us-east-1.sns"
}

variable "sns_email" {
  description = "SNS email subscription"
  sensitive = true
}