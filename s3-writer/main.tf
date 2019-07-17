provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket_object" "object" {
  bucket  = "${var.BUCKET_NAME}"
  key     = "${var.SANDBOX_ID}"
  content = "USER_CONTENT:${var.USER_CONTENT}\nSERVER_NAME:${var.SERVER_NAME}\nSERVER_VERSION:${var.SERVER_VERSION}\nOUTPUT_PUBLISHER_STR:${var.OUTPUT_PUBLISHER_STR}\nOUTPUT_PUBLISHER_OBJ:${var.OUTPUT_PUBLISHER_OBJ}\nOUTPUT_PUBLISHER_MAP:${var.OUTPUT_PUBLISHER_MAP}\nOUTPUT_PUBLISHER_LIST:${var.OUTPUT_PUBLISHER_LIST}"
}

data "external" "presign" {
  program = ["bash", "presign.sh", "${var.BUCKET_NAME}", "${var.SANDBOX_ID}"]
  depends_on = ["aws_s3_bucket_object.object"]
}