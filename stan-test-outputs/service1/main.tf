provider "aws" {
  region = "eu-west-1"
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Owner = "Stan"
    Name = "stan-test-vpc"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Owner = "Stan"
    Name = "stan-test-subnet"
  }
}

output "subnet_arn" {
  value = aws_subnet.subnet.arn
}

output "test_value" {
  value = "some\\value"
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

output "multi_line" {
  value = <<EOF
line 1
line 2
line 3
EOF
}
