provider "azurerm" {
  version = "=1.28.0"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  subscription_id = "${var.subscription_id}"
  tenant_id       = "${var.tenant_id}"
}

resource "azurerm_resource_group" "default" {
  name     = "sqlsvr-${var.sandbox_id}-rg"
  location = "${var.location}"
}

resource "azurerm_sql_server" "default" {
  name                = "sqlsvr-${var.sandbox_id}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  location            = "${azurerm_resource_group.default.location}"
  version                      = "12.0"
  administrator_login          = "${var.username}"
  administrator_login_password = "${var.password}"
}

resource "azurerm_sql_database" "default" {
  name                             = "${var.db_name}"
  resource_group_name              = "${azurerm_resource_group.default.name}"
  location                         = "${azurerm_resource_group.default.location}"
  server_name                      = "${azurerm_sql_server.default.name}"
  edition                          = "Basic"
  collation                        = "SQL_Latin1_General_CP1_CI_AS"
  create_mode                      = "Default"
  requested_service_objective_name = "Basic"
}

data "azurerm_subnet" "default" {
  name                 = "${var.subnet_name}"
  virtual_network_name = "${var.subnet_vnet}"
  resource_group_name  = "${var.subnet_resource_group}"
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetrule" {
  name                = "aks-sql-vnet-rule"
  server_name         = "${azurerm_sql_server.default.name}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  subnet_id           = "${data.azurerm_subnet.default.id}"
}


