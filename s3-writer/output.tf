output "sandbox" {
  value = "${var.SANDBOX_ID}"
}

output "bucket" {
  value = "${var.BUCKET_NAME}"
}

output "s3_file_url" {
  value = "${data.external.presign.result.url}"
}
