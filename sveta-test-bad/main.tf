provider "azurerm" {
  version = "=1.36.0"
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

# data "azurerm_resource_group" "test" {
#   name = "${var.rg_name}"
# }

# output "rg_id" {
#   value = "${data.azurerm_resource_group.test.id}"
# }

