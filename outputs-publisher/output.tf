output "str" {
  value = "${var.str}"
}

output "list" {
  value = "${var.list}"
}

output "map" {
  value = "${var.map}"
}

output "obj" {
   value = "${var.obj}"
}

output "special_chars_str" {
  value = "some::text:with-chars-4&more/chars_123^value"
}

output "number" {
  value = ${var.number}
}

output "fraction" {
  value = ${var.fraction}
}

output "bool" {
  value = ${var.bool}
}