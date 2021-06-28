variable "HOST" {
  type = string
}

variable "SANDBOX_PUBLIC_ADDRESS" {
  type = string
}

provider "aws" {
  assume_role {
    role_arn     = "arn:aws:iam::513341655526:role/PowerUserAccess"
    session_name = "SET_A_RECORD_SESSION"
  }
}

resource "dns_a_record_set" "www" {
  zone = "${var.HOST}."
  addresses = [
    "${var.SANDBOX_PUBLIC_ADDRESS}"
  ]
}

