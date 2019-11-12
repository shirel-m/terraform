variable "aws_region" {
  default     = "eu-west-1"
  description = "AWS Region"
}

variable "db_name" {
  description = "DB Name"
}

variable "username" {
  default     = "admin"
  description = "User name"
}

variable "password" {
  description = "Database password"
}

variable "sandbox_id" {
  description = "Colony sandbox id"
}

variable "engine" {
  default = "sqlserver-ex"
  description = "RDS Engine"
}

variable "engine_version" {
  default = "14.00.3049.1.v1"
  description = "RDS Engine version"
}

variable "instance_class" {
  default = "db.t2.medium"
  description = "RDS instance size"
}
