variable "bot_name" {
  type = string
}

variable "description" {
  type = string
}

variable "lambda_arn" {
  type = string
}

variable "idle_session_ttl" {
  type = number
}

variable "role_arn" {
  type = string
}

variable "bot_zip_file" {
  type = string
}

variable "locale_id" {
  default = "en_US"
}

variable "alias_name" {
  default = "TestBotAlias"
}

variable "bot_alias_name" {
  description = "Lex Bot Alias"
  type        = string
  default     = "TestBotAlias"
}