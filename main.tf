provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "b" {
  bucket = "skc-tf-bucket"
  acl = "private"

  tags = {
      Name = "My bucket1"
      Environment = "Dev"
  }
}
