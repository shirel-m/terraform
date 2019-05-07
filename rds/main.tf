provider "aws" { }

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "${var.DB_NAME}"
  username             = "${var.DB_USER}"
  password             = "${var.DB_PASS}"
  parameter_group_name = "default.mysql5.7"
}