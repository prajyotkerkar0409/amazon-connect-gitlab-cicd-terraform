resource "terraform_data" "lex_import" {

  triggers_replace = {
    file = filesha256(local.import_file)
  }

  provisioner "local-exec" {

    command = <<EOT

aws lexv2-models create-upload-url \
--region ${data.aws_region.current.name} \
> upload.json

EOT

  }

}

data "aws_region" "current" {}