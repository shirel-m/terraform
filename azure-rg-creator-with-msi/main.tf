provider "azurerm" {
  version = "=1.35.0"
  # explicitly requiring msi authentication
  use_msi = true
  subscription_id = "${var.subscription_id}"
}

variable "subscription_id" {
}

variable "rg_name" {
}

resource "azurerm_resource_group" "rg" {
  name = "${var.rg_name}"
  location = "West Europe"
}

output "rg_id" {
  value = "${azurerm_resource_group.rg.id}"
}

