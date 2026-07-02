resource "terraform_data" "wait_import" {

  depends_on = [
    terraform_data.upload_zip
  ]

  provisioner "local-exec" {

command = <<EOT

IMPORT_ID=$(cat import.id)

while true
do

STATUS=$(aws lexv2-models describe-import \
--region ${data.aws_region.current.name} \
--import-id $IMPORT_ID \
| jq -r '.importStatus')

echo $STATUS

if [ "$STATUS" = "Completed" ]; then
    break
fi

if [ "$STATUS" = "Failed" ]; then
    echo "Lex import failed."
    exit 1
fi
sleep 20

done

EOT

  }

}