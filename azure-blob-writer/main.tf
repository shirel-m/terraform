provider "azurerm" {
  version = "=1.35.0"   # the earliest version we support for msi
}

resource "azurerm_storage_blob" "blob_to_create" {
  name                   = var.blob_name != "" ? var.blob_name : var.SANDBOX_ID
  storage_account_name   = "${var.storage_account_name}"
  storage_container_name = "${var.storage_container_name}"
  type                   = "Block"
  source_content         = <<EOF
USER_CONTENT:${var.USER_CONTENT}
SERVER_NAME:${var.SERVER_NAME}
SERVER_VERSION:${var.SERVER_VERSION}
OUTPUT_PUBLISHER_STR:${var.OUTPUT_PUBLISHER_STR}
VIRTUAL_NETWORK_ID:${var.VIRTUAL_NETWORK_ID}
PUBLIC_ADDRESS:${var.PUBLIC_ADDRESS}
PUBLIC_ADDRESS_OLD:${var.PUBLIC_ADDRESS_OLD}
SANDBOX_ID:${var.SANDBOX_ID}
SANDBOX_ID_OLD:${var.SANDBOX_ID_OLD}
OUTPUTS:${var.OUTPUTS}
ALL_IN_ONE:${var.ALL_IN_ONE}
EOF
}
