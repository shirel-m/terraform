output "sum_output" {
  value = "sum([${var.int_input},${var.float_input}])"
}
