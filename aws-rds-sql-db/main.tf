provider "aws" {
    region     = "${var.aws_region}"
}

data "aws_vpc" "sandbox_vpc" {
  tags = {
    colony-sandbox-id = "${var.sandbox_id}"
  }
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

resource "aws_security_group" "allow_all_sql" {
  name        = "allow_all_sql_server"
  description = "Allow SQL Server inbound traffic from all sources"
  vpc_id      = "${data.aws_vpc.sandbox_vpc.id}"

  ingress {
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = "0.0.0.0/0"
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "${var.engine}"
  engine_version       = "${var.engine_version}"
  instance_class       = "${var.instance_class}"
  identifier           = "rds-sql-${var.sandbox_id}"
  # name                 = "${var.db_name}"
  username             = "${var.username}"
  password             = "${var.password}"
  # parameter_group_name = "default.${var.engine}${var.engine_version}"
  port                 = 1433
  vpc_security_group_ids  = ["${aws_security_group.allow_all_sql.id}"]
  backup_retention_period = 0
  license_model           = "license-included"
  db_subnet_group_name    = "${aws_db_subnet_group.subnet_group.id}"
}