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
