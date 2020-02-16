provider "azurerm" {
  version = "=1.35.0"   # the earliest version we support for msi
  # explicitly requiring msi authentication
  use_msi = true
  subscription_id = "${var.subscription_id}"

}

resource "azurerm_storage_blob" "blob_to_create" {
  name                   = "${var.blob_name}"
  storage_account_name   = "${var.storage_account_name}"
  storage_container_name = "${var.storage_container_name}"
  type                   = "Block"
  source_content         = "${var.content}"
}
