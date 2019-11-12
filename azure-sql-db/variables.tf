variable "location" {
  description = "The Azure Region in which all resources should be created."
}
variable "db_name" {
  description = "db name"
}

variable "username" {
  description = "User name"
}

variable "password" {
  description = "Database password"
}

variable "sandbox_id" {
  description = "Colony sandbox id"
}

variable "client_id" {
  description = "The Client ID which should be used"
}

variable "client_secret" {
  description = "The Client Secret which should be used"
}

variable "subscription_id" {
  description = "The Subscription ID which should be used"
}

variable "tenant_id" {
  description = "The Tenant ID which should be used"
}