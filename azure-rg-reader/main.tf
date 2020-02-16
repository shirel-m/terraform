provider "azurerm" {
  version = "=1.35.0"   # the earliest version we support for msi
}

variable "subscription_id" {
}

variable "rg_name" {
}

data "azurerm_resource_group" "rg" {
  name = "${var.rg_name}"
}

output "rg_id" {
  value = "${data.azurerm_resource_group.rg.id}"
}
