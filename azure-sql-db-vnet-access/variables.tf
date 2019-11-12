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

variable "subnet_name" {
  description = "Specifies the name of the Subnet, ensure that Mycrosoft.SQL is available to access to this subnet"
}

variable "subnet_vnet" {
  description = "Specifies the name of the Virtual Network this Subnet is located"
}

variable "subnet_resource_group" {
  description = "Specifies the name of the resource group the Virtual Network is located in"
}


