variable "BUCKET_NAME" {}
variable "SANDBOX_ID" {}
variable "CONTENT" {}


variable "str" {
  type = string
}

variable "num" {
  type = number
  default = 100
}

variable "boolean" {
  type = bool
  default = true
}


variable "list_str" {
  type    = list(string)
  default = ["a", "b", "c"]
}

variable "list_numbers" {
  type    = list(number)
  default = [1,2,3]
}

variable "map" {
  type = "map"
  default = {
      "user-a" = "a-topic",
      "user-b" = "c-topic",
      "user-c" = "c-topic"
  }
}

variable "obj" {
  type = "object"
  default = {
    "age" = 52,
    "name" = "John",
    "user" = [
      {
        "user-a" = "a-topic",
        "user-b" = "c-topic",
        "user-c" = "c-topic"
      }
    ]
  }
}