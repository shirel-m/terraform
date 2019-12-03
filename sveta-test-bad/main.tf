provider "azurerm" {
  version = "=1.36.0"

  use_msi = true
  # subscription_id = "${var.subscription_id}"
  skip_provider_registration = true
}

variable "subscription_id" {
  description = "The Subscription ID which should be used"
}

variable "rg_name" {
  description = "resource group name"
}

variable "sandbox_id" {
  description = "Colony sandbox id"
}

resource "azurerm_resource_group" "test" {
  name = "${var.rg_name}-${var.sandbox_id}"
  location = "West Europe"
}

output "rg_id" {
  value = "${azurerm_resource_group.test.id}"
}

