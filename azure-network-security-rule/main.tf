provider "azurerm" {
  version = "=1.36.0"
  client_id = "${var.client_id}"
  client_secret = "${var.client_secret}"
  subscription_id = "${var.subscription_id}"
  tenant_id = "${var.tenant_id}"
}

resource "azurerm_network_security_rule" "rule" {
  name                        = "allowSandboxTraffic"
  priority                    = 4070
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${var.resource_group}"
  network_security_group_name = "app_shared_security_group"
}
