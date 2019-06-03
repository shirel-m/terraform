output "from_content_variable" {
  value = "${var.CONTENT}"
}

output "str" {
  value = "text"
}

output "num" {
  value = 100
}

output "list_numbers" {
  value = [1, 2, 3]
}
output "list_str" {
  value = ["a", "b", "c"]
}

output "map" {
  value = {
      "user-a" = "a-topic",
      "user-b" = "c-topic",
      "user-c" = "c-topic"
  }
}

output "obj" {
  value = {
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

output "map_internal_only" {
  value = {
      "user-y" = "y-topic"
  }
}

