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

provider "awscc" {
  region = var.aws_region
}