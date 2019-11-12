output "server_name" {
  value = "${azurerm_sql_server.default.fully_qualified_domain_name}"
}

output "database_name" {
  value = "${azurerm_sql_database.default.name}"
}

output "server_admin_login_name" {
  value = "${var.username}"
}