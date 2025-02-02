terraform {
    backend "s3" {
        bucket = "zamacraig-terraform-backend" #var.s3_backend_bucket
        key = "3-tier-application/terraform.tfstate" #var.s3_backend_key
        region = "us-east-1" #var.region
    }
}

provider "aws" {
  region = var.region
}