variable "HOST" {
  type = string
}

variable "SANDBOX_PUBLIC_ADDRESS" {
  type = string
}

resource "dns_a_record_set" "www" {
  zone = "${var.HOST}."
  addresses = [
    "${var.SANDBOX_PUBLIC_ADDRESS}"
  ]
}