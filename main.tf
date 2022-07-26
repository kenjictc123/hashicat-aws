variable "AWS_ACCESS_KEY_ID" {}
variable "AWS_SECRET_ACCESS_KEY" {}
variable "AWS_REGION" {}
variable "aws_vpc_cidr" {}
variable "prefix" {}

provider "aws" {
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
  region = var.AWS_REGION
}

resource "aws_vpc" "test-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "test-vpc"
  }
}
