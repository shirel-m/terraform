output "output_from_content_variable" {
  value = "${var.CONTENT}"
}

output "output_str" {
  value = "text"
}

output "output_num" {
  value = 100
}

output "output_list_numbers" {
  value = [1, 2, 3]
}
output "output_list_str" {
  value = ["a", "b", "c"]
}

output "output_map" {
  value = {
      "user-a": "a-topic",
      "user-b": "c-topic",
      "user-c": "c-topic"
  }
}

output "output_obj" {
  value = {
    "age": 52,
    "name": "John",
    "user": [
      {
        "user-a": "a-topic",
        "user-b": "c-topic",
        "user-c": "c-topic"
      }
    ]
  }
}


