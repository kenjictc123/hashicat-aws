terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "hisaken-test"
    workspaces {
      name = "hashicat-aws"
    }
  }
}
