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
  default = "postgres"
  description = "RDS Engine"
}

variable "engine_version" {
  default = "9.6"
  description = "RDS Engine version"
}

variable "instance_class" {
  default = "db.t2.small"
  description = "RDS instance size"
}
