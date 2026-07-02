resource "terraform_data" "alias" {

  depends_on = [
    terraform_data.wait_import
  ]

  provisioner "local-exec" {

    command = <<EOT

echo "=============================="
echo "Creating Bot Version"
echo "=============================="

BOT_ID=$(aws lexv2-models list-bots \
    --query "botSummaries[?botName=='${var.bot_name}'].botId" \
    --output text)

echo "Bot ID: $BOT_ID"

BOT_VERSION=$(aws lexv2-models create-bot-version \
    --bot-id $BOT_ID \
    --query "botVersion" \
    --output text)

echo "Bot Version: $BOT_VERSION"

echo "Waiting for bot version..."

while true
do

STATUS=$(aws lexv2-models describe-bot-version \
    --bot-id $BOT_ID \
    --bot-version $BOT_VERSION \
    --query "botStatus" \
    --output text)

echo "Current Status: $STATUS"

if [ "$STATUS" = "Available" ]; then
    break
fi

sleep 20

done

echo "=============================="
echo "Checking Alias"
echo "=============================="

ALIAS_ID=$(aws lexv2-models list-bot-aliases \
    --bot-id $BOT_ID \
    --query "botAliasSummaries[?botAliasName=='TestBotAlias'].botAliasId" \
    --output text)

if [ -z "$ALIAS_ID" ] || [ "$ALIAS_ID" = "None" ]; then

echo "Creating Alias..."

aws lexv2-models create-bot-alias \
    --bot-id $BOT_ID \
    --bot-alias-name TestBotAlias \
    --bot-version $BOT_VERSION \
    --bot-alias-locale-settings '{
      "en_US": {
        "enabled": true,
        "codeHookSpecification": {
          "lambdaCodeHook": {
            "lambdaARN": "'${var.lambda_arn}'",
            "codeHookInterfaceVersion": "1.0"
          }
        }
      }
    }'

else

echo "Updating Existing Alias..."

aws lexv2-models update-bot-alias \
    --bot-id $BOT_ID \
    --bot-alias-id $ALIAS_ID \
    --bot-alias-name TestBotAlias \
    --bot-version $BOT_VERSION \
    --bot-alias-locale-settings '{
      "en_US": {
        "enabled": true,
        "codeHookSpecification": {
          "lambdaCodeHook": {
            "lambdaARN": "'${var.lambda_arn}'",
            "codeHookInterfaceVersion": "1.0"
          }
        }
      }
    }'

fi

echo "=============================="
echo "Lex Alias Successfully Configured"
echo "=============================="

EOT

  }

}