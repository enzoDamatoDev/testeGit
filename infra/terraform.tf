terraform {
  backend "s3" {
    region = "us-east-1"
    bucket = "bucket-teste-tc1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

  required_version = ">= 1.10.0"
}
