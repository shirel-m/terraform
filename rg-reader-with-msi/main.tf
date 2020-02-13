provider "azurerm" {
  version = "=1.35.0"
  # explicitly requiring msi authentication
  use_msi = true
}

variable "rg_name" {
}

data "azurerm_resource_group" "rg" {
  name = "${var.rg_name}"
}

output "rg_id" {
  value = "${data.azurerm_resource_group.rg.id}"
}
