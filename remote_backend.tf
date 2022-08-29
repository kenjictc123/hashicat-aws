terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "hisaken-test"
    workspaces {
      name = "hashicat-aws"
    }
  }
}

data "aws_vpc" "example"{
  id = "vpc-6ab1320e"
}
