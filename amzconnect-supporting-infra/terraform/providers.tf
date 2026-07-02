provider "aws" {

  region = var.aws_region

  default_tags {

    tags = {

      Project     = "AmazonConnect"

      Environment = var.environment

      ManagedBy   = "Terraform"

      Owner       = "Integration"

    }

  }

}