resource "aws_s3_bucket_object" "object" {
  bucket  = "${var.bucket}"
  key     = "${var.prefix}${var.sandbox_id}.json"
  content = "['Jenkins', 'Linux', 'Docker', 'Gamal', 'Python']"
}