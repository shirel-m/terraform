output "int_output" {
  value = random_integer.randomint.result
}

output "bool_output" {
  value = tobool("true")
}

output "float_output" {
  value = tonumber("0.01")
}
