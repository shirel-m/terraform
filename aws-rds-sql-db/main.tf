provider "aws" {
    region     = "${var.aws_region}"
}

data "aws_vpc" "sandbox_vpc" {
  tags = {
    colony-sandbox-id = "${var.sandbox_id}"
  }
}

data "aws_security_group" "default" {
  vpc_id = "${data.aws_vpc.sandbox_vpc.id}"
  name   = "default"
}

data "aws_subnet" "app_subnet_0" {
  tags = {
    Name = "app-subnet-0"
    colony-sandbox-id = "${var.sandbox_id}"
  }
}

data "aws_subnet" "app_subnet_1" {
  tags = {
    Name = "app-subnet-1"
    colony-sandbox-id = "${var.sandbox_id}"
  }
}

resource "aws_db_subnet_group" "subnet_group" {
  name       = "main"
  subnet_ids = ["${data.aws_subnet.app_subnet_0.id}", "${data.aws_subnet.app_subnet_1.id}"]
}

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "${var.engine}"
  engine_version       = "${var.engine_version}"
  instance_class       = "${var.instance_class}"
  # identifier           = "rds-${var.sandbox_id}"
  # name                 = "${var.db_name}"
  username             = "${var.username}"
  password             = "${var.password}"
  # parameter_group_name = "default.${var.engine}${var.engine_version}"
  port                 = 1433
  vpc_security_group_ids  = ["${data.aws_security_group.default.id}"]
  backup_retention_period = 0
  license_model           = "license-included"
  db_subnet_group_name    = "${aws_db_subnet_group.subnet_group.id}"
}