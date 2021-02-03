provider "aws" {
  region = "eu-west-1"
}

variable "subnet_arn" {
  type = string
  description = "Subnet ARN"
}

variable "test_value" {
  type = string
  description = "Some value"
}

data "aws_arn" "subnet_arn" {
  arn = var.subnet_arn
}

output "name" {
  value = data.aws_arn.subnet_arn
}

output "input_value" {
  value = var.test_value
}
