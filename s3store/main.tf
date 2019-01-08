resource "aws_s3_bucket" "b" {
  bucket = "${var.bucket}"
  acl    = "private"
}

resource "aws_s3_bucket_object" "object" {
  bucket  = "${aws_s3_bucket.b.bucket}"
  key     = "data.json"
  content = "['Jenkins', 'Linux', 'Docker', 'Gamal', 'Python']"
}