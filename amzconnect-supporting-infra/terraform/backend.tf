terraform {

  backend "s3" {

    bucket         = "YOUR-TERRAFORM-STATE"

    key            = "lexbot/terraform.tfstate"

    region         = "eu-west-2"

    encrypt        = true

    dynamodb_table = "terraform-lock"

  }

}