resource "aws_s3_bucket_object" "object" {
  bucket  = "${var.bucket}"
  key     = "${var.sandboxid}.json"
  content = "[\"${var.item1}\", \"${var.item2}\", \"${var.item3}\"]"
}