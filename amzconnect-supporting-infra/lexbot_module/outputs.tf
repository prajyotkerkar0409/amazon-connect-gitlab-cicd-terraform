output "bot_name" {
  description = "Lex Bot Name"
  value       = var.bot_name
}

output "lambda_arn" {
  description = "Lambda ARN attached to the bot"
  value       = var.lambda_arn
}

output "bot_description" {
  description = "Lex Bot Description"
  value       = var.description
}

output "idle_session_ttl" {
  description = "Session timeout in seconds"
  value       = var.idle_session_ttl
}