terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "proj-tfstate"
    key            = "s3bucket/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform"
  }
}

provider "aws" {
  region  = "eu-west-1"
  default_tags {
    tags = {
      owner     = "crommie"
      project   = "fastapi"
      terraform = "true"
      env       = "dev"
    }
  }
}