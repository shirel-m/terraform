provider "aws" {
  access_key = "${var.AWS_ACCESS_KEY_ID}"
  secret_key = "${var.AWS_SECRET_ACCESS_KEY}"
  region     = "${var.AWS_DEFAULT_REGION}"
}
resource "aws_s3_bucket_object" "object" {
  bucket  = "${var.bucket}"
  key     = "${var.SANDBOX_ID}.json"
  content = "[\"${var.SANDBOX_DNS}\", \"${var.item1}\", \"${var.item2}\", \"${var.item3}\"]"
}
