provider "aws" {
  region = "us-east-2"
}

variable "site_name" {
  description= "site name used for the bucket"
  type = string
  default = "skc-default-web-site"
}

resource "aws_s3_bucket" "b" {
  bucket = var.site_name
  acl = "private"

  tags = {
      Name = var.site_name
      Environment = "Dev"
  }
}

data "aws_vpc" "anyname"{
  default = true
}

output "my_output" {
  value = concat([data.aws_vpc.anyname.cidr_block],[var.site_name]) 
}

resource "aws_s3_bucket_object" "object" {
  key="index.html"
  bucket = var.site_name
  source = "index.html"
  force_destroy = true
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


