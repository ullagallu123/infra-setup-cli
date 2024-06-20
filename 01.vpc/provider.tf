terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.53.0"
    }
  }

  backend "s3" {
    bucket         = "expense-ugl-infra-terraform"
    key            = "expense/vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
  }
}


provider "aws" {
  region  = "us-east-1"
}