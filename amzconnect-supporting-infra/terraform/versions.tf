terraform {

  required_version = ">= 1.8"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

    awscc = {
      source  = "hashicorp/awscc"
      version = "~> 1.39"
    }

    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.7"
    }

    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }

  }

}