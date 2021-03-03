provider "aws" {
  region = "eu-west-1"
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
}

output "subnet_arn" {
  value = aws_subnet.subnet.arn
}

output "test_value1" {
  value = "somevalue"
}

output "test_value2" {
  value = "test&test"
}

output "test_value3" {
  value = "test_val3"
}

output "test_value4" {
  value = "test^val4"
}