variable "AWS_ACCESS_KEY_ID" {}
variable "AWS_SECRET_ACCESS_KEY" {}
variable "AWS_REGION" {}
variable "AWS_VPC_CIDR" {}
variable "prefix" {}

provider "aws" {
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
  region = var.AWS_REGION
}

resource "aws_vpc" "test-vpc" {
  cidr_block = var.AWS_VPC_CIDR
  tags = {
    Name = "test-vpc"
  }
}
