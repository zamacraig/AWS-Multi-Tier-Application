variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone for the subnet"
  type        = string
}
