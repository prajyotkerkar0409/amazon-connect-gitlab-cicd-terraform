resource "terraform_data" "upload_zip" {

  depends_on = [
    terraform_data.lex_import
  ]

  provisioner "local-exec" {

command = <<EOT

UPLOAD_URL=$(jq -r '.uploadUrl' upload.json)

curl -X PUT \
-T ${local.import_file} \
"$UPLOAD_URL"

IMPORT_ID=$(aws lexv2-models start-import \
--region ${data.aws_region.current.name}
--payload file://upload.json \
--merge-strategy Overwrite \
--resource-specification file://resource.json \
| jq -r '.importId')

echo $IMPORT_ID > import.id

EOT

  }

}