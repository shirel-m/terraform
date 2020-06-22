provider "aws" {
  region = "eu-west-1"
  access_key = var.AWS_ACCESS_KEY == "none" ? "" : var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_ACCESS == "none" ? "" : var.AWS_SECRET_ACCESS
}

resource "aws_s3_bucket_object" "object" {
  bucket  = "${var.BUCKET_NAME}"
  key     = "${var.SANDBOX_ID}.json"
  acl     = "bucket-owner-full-control"
  content = <<EOF
USER_CONTENT:${var.USER_CONTENT}
SANDBOX_ID:${var.SANDBOX_ID}
EOF
}
