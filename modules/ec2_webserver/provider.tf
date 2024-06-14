terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.11.0"
    }
  }
}

###Defining provider as aws###
provider "aws" {
  region = "var.aws_region"
}