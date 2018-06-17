variable "env" {
  description = "environment variables"
}

variable "access_key" {
}

variable "secret_key" {
}

provider "aws" {
  region = "ap-southeast-2"
  access_key = ""
  secret_key = ""
}

resource "random_id" "rnd_terraformers" {
  byte_length = 8
}

resource "aws_s3_bucket" "s3_terraformers" {
  bucket = "tfbucket_${random_id.rnd_terraformers.hex}"
  acl    = "private"

  tags {
    Name        = "tfbucket_${random_id.rnd_terraformers.hex}"
    Environment = "${var.env}"
  }
}