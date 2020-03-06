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

resource "aws_s3_bucket_object" "object" {
  bucket = "skc-tf-bucket"
  key = "index.html"
  source = "index.html"
}


resource "aws_security_group" "instance" {
  name= "terraform-security-instance"

  ingress{
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


