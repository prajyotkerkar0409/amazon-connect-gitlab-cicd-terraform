module "lex_bot" {

  source = "../lexbot_module"

  bot_name = var.bot_name

  lambda_arn = var.lambda_arn

  idle_session_ttl = var.idle_session_ttl

  description = var.description

  role_arn = var.role_arn

  bot_zip_file = var.bot_zip_file

}