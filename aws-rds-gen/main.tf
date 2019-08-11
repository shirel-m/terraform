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
