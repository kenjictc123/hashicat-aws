variable aws_access_key_id {}
variable aws_secret_access_key {}
variable aws_region {}
variable aws_vpc_cidr {}

provider "aws" {
  access_key = var.aws_acess_key_id
  secret_key = var.aws_secret_access_key
  region = var.aws_region
}

# -----------------------------------
# VPCの作成
# -----------------------------------
resource "aws_vpc" "test-vpc" {
  cidr_block = var.aws_vpc_cidr
  tags = {
    Name = "test-vpc"
  }
}

# -----------------------------------
# S3の作成
# -----------------------------------
### バケット作成 ###
resource "aws_s3_bucket" "terraform_test" {
  # S3のバケット名
  bucket = "test-bucket-20220726-hisa" ###要変更###
  # アクセス管理
  acl = "private"
  # バージョニングの有効化
  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_test" {
  # 対象のバケット
  bucket = aws_s3_bucket.terraform_test.id
  # パブリックのアクセスをブロック
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
