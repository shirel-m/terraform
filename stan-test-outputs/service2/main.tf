provider "aws" {
  region = "eu-west-1"
}

variable "subnet_arn" {
  type = string
  description = "Subnet ARN"
}

variable "test_value" {
  type = string
  description = "Value with \\"
}

variable "test_value2" {
  type = string
  description = "Value with &"
}

variable "test_value3" {
  type = string
  description = "Value with _"
}

variable "test_value4" {
  type = string
  description = "Value with ^"
}

data "aws_arn" "subnet_arn" {
  arn = var.subnet_arn
}

output "input_subnet_arn" {
  value = data.aws_arn.subnet_arn
}

output "input_value" {
  value = var.test_value
}

output "input_value2" {
  value = var.test_value2
}

output "input_value3" {
  value = var.test_value3
}

output "input_value4" {
  value = var.test_value4
}

