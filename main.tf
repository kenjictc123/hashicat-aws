terraform {
  # 使用するAWSプロバイダーのバージョン指定（結構更新が速い）
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.42"
    }
  }
}

# 明示的にAWSプロバイダを定義（暗黙的に理解してくれるけど）
provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key


  # 作成する全リソースに自動的に付与するタグ設定
  default_tags {
    tags = {
      env = "terraform_test"
    }
  }
}
