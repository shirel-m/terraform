output "sandbox" {
  value = "${var.SANDBOX_ID}"
}

output "blob_url" {
  value = "${azurerm_storage_blob.blob_to_create.url}"
}

output "file_access_url" {
  value = "${azurerm_storage_blob.blob_to_create.url}?${data.external.generate_sas.result.serviceSasToken}"
}
