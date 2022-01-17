terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "hisanaga-training"
    workspaces {
      name = "hashicat-aws"
    }
  }
}
