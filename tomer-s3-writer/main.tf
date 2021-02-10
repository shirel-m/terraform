provider "aws" {
  region = "eu-west-1"
  access_key = var.AWS_ACCESS_KEY == "none" ? "" : var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_ACCESS == "none" ? "" : var.AWS_SECRET_ACCESS
}

locals {
  common_tags = {
    environment  = "tintin"
  }
  extra_tags  = {
    support = "yes"
  }
}

# resource "aws_s3_bucket_object" "object" {
#   bucket  = "${var.BUCKET_NAME}"
#   key     = "${var.SANDBOX_ID}.json"
#   acl     = "bucket-owner-full-control"
#   content = <<EOF
# USER_CONTENT:${var.USER_CONTENT}
# SANDBOX_ID:${var.SANDBOX_ID}
# EOF
# }

resource "aws_security_group" "zoro6" {
  name        = "tintin_sg_test6"
  tags = merge(
    {
      "age" = format("%s", "10")
    },
    local.common_tags,
    local.extra_tags,
  )
}
