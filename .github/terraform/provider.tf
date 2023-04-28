terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "proj-tfstate"
    key            = "test-lambda/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform"
  }
}

provider "aws" {
  region = "us-west-2"
  default_tags {
    tags = {
      owner     = "crommie"
      project   = "lambda-s3"
      terraform = "true"
      env       = "dev"
    }
  }
}
