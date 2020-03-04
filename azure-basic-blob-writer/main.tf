provider "azurerm" {
  version = "=1.35.0"   # the earliest version we support for msi
}

provider "external" {
  version = "=1.2"
}

resource "azurerm_storage_blob" "blob_to_create" {
  name                   = "${var.blob_name}"
  storage_account_name   = "${var.storage_account_name}"
  storage_container_name = "${var.storage_container_name}"
  type                   = "Block"
  source_content         = "${var.content}"
}

data "external" "generate_sas" {
  program = [
    "bash",
    "generate_sas.sh", 
    "${azurerm_storage_blob.blob_to_create.storage_account_name}",
    "${azurerm_storage_blob.blob_to_create.storage_container_name}", 
    "${azurerm_storage_blob.blob_to_create.name}",
    "${var.storage_account_resource_group != "" ? var.storage_account_resource_group : var.storage_account_name}"
  ]
  # note: this is terraform 0.12 syntax
  depends_on = [azurerm_storage_blob.blob_to_create]  # adding a dependency so it won't be executed at the plan phase (as part of refreshing state)
}