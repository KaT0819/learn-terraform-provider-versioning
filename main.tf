provider "aws" {
  region     = "us-west-2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "random_pet" "petname" {
  length    = 5
  separator = "-"
}

resource "aws_s3_bucket" "sample" {
  bucket = random_pet.petname.id

  # aclは非推奨 aws_s3_bucket_aclを使用する
  #   acl = "public-read"
  #   acl = "private"
  #   region = "us-west-2"
}
