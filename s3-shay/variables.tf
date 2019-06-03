variable "BUCKET_NAME" {}
variable "SANDBOX_ID" {}
variable "CONTENT" {}


variable "testmapvar" {
  type = "map"
  default = {
    key1 = "value1"
    key2 = "value2"
  }
}