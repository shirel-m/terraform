provider "azurerm" {
  version = "=1.35.0"   # the earliest version we support for msi
}

resource "azurerm_storage_blob" "my_blob" {
  name                   = "${var.blob_name}"
  storage_account_name   = "${var.storage_account_name}"
  storage_container_name = "${var.storage_container_name}"
  type                   = "Block"
  source_content         = "${var.content}"
}