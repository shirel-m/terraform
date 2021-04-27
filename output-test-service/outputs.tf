output "int_output" {
  value = random_integer.randomint.result
}

output "bool_output" {
  value = tobool("true")
}

output "float_output" {
  value = tonumber("0.01")
}

output "date_output" {
  value = formatdate("MMM DD, YYYY", "2018-01-02T23:12:01Z")
}

output "string_output" {
  value = "'\"\\/"
}
