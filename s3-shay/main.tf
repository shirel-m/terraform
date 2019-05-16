provider "aws" {}
data "aws_region" "current" {}
resource "aws_s3_bucket_object" "object" {
  bucket  = "${var.bucket}"
  key     = "${var.SANDBOX_ID}.json"
  content = "{ \"SANDBOX_DNS\": \"${var.SANDBOX_DNS}\", \"Constant\": \"${var.Constant}\", \"Other\": \"${var.Other}\", \"Default Region\": \"${data.aws_region.current.name}\" }"
}
