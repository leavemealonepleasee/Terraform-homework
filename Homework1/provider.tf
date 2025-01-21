terraform {
  required_version = ">= 1.0.0"  # You can specify the required Terraform version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"  # Use a suitable version constraint for the AWS provider
    }
  }
}



provider "aws" {
  region = "us-east-1"
}

