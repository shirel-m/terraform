provider "aws" {}
data "aws_region" "current" {}
resource "aws_s3_bucket_object" "object" {
  bucket  = "${var.BUCKET_NAME}"
  key     = "${var.SANDBOX_ID}.json"
  content = "{ \"Content\": \"${var.CONTENT}\", \"Default Region\": \"${data.aws_region.current.name}\" }"
}
