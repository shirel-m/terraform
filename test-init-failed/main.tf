variable "subscription_id" {
  description = "The Subscription ID which should be used"
}

variable "rg_name" {
  description = "resource group name"
}

variable "sandbox_id" {
  description = "Colony sandbox id"
}

output "rg_id" {
  value = "${azurerm_resource_group.test.id}"
}