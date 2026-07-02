##############################################
# Environment
##############################################

aws_region = "eu-west-2"

environment = "dev"

##############################################
# Lex Bot
##############################################

bot_name = "ELC-CCE-Bot"

description = "ELC Customer Care Lex Bot"

idle_session_ttl = 300

##############################################
# Lambda Code Hook
##############################################

lambda_arn = "arn:aws:lambda:eu-west-2:660388268716:function:elc-cce-intent-router"

##############################################
# IAM Role
##############################################

role_arn = "arn:aws:iam::660388268716:role/aws-service-role/lexv2.amazonaws.com/AWSServiceRoleForLexV2Bots_0AIERO9XH6U"

##############################################
# Exported Lex Bot ZIP
##############################################

bot_zip_file = "../imports/resources/bots/elc-cce-bot-na.zip"