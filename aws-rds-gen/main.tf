provider "aws" {
  region     = "eu-west-1"
  access_key = var.AWS_ACCESS_KEY == "none" ? "" : var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_ACCESS == "none" ? "" : var.AWS_SECRET_ACCESS
}

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "${var.engine}"
  engine_version       = "${var.engine_version}"
  instance_class       = "${var.instance_class}"
  identifier           = "rds-${var.sandbox_id}"
  username             = "${var.username}"
  password             = "${var.password}"
  parameter_group_name = "default.${var.engine}${var.engine_version}"
}
