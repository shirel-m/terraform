provider "azurerm" {
  version = "=1.36.0"

  use_msi = true
  subscription_id = "${var.subscription_id}"
}

variable "subscription_id" {
  description = "The Subscription ID which should be used"
}

variable "rg_name" {
  description = "resource group name"
}

data "azurerm_resource_group" "test" {
  name = "${var.rg_name}"
}

output "rg_id" {
  value = "${data.azurerm_resource_group.test.id}"
}

