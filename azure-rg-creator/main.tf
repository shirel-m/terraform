provider "azurerm" {
  version = "=1.35.0"   # the earliest version we support for msi
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

