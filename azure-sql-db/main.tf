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

resource "azurerm_sql_firewall_rule" "default" {
  name                = "allow-azure-services"
  resource_group_name = "${azurerm_resource_group.default.name}"
  server_name         = "${azurerm_sql_server.default.name}"
  start_ip_address    = "0.0.0.0" # Allow access to Azure services
  end_ip_address      = "0.0.0.0"
}