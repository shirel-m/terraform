provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket_object" "object" {
  bucket  = "${var.BUCKET_NAME}"
  key     = "${var.SANDBOX_ID}.json"
  content = "{ 
    \"UserContent\": \"${var.USER_CONTENT}\", 
    \"SERVER_NAME\": \"${var.SERVER_NAME}\", 
    \"SERVER_VERSION\": \"${var.SERVER_VERSION}\",
    \"OUTPUT_PUBLISHER_STR\": \"${var.OUTPUT_PUBLISHER_STR}\",
    \"OUTPUT_PUBLISHER_OBJ\": \"${var.OUTPUT_PUBLISHER_OBJ}\",
    \"OUTPUT_PUBLISHER_MAP\": \"${var.OUTPUT_PUBLISHER_MAP}\",
    \"OUTPUT_PUBLISHER_LIST\": \"${var.OUTPUT_PUBLISHER_LIST}\"
  }"
}
