variable "DOMAIN" {
  type = string
}

variable "HOST" {
  type = string
}

variable "SANDBOX_PUBLIC_ADDRESS" {
  type = string
}

provider "aws" {
  region = "eu-west-1"
#  assume_role {
#    role_arn     = "arn:aws:iam::513341655526:role/colony/7ee79e8a-785b-ef52-11a1-17ef95ee3344/colony-services-access-role-7ee79e8a-785b-ef52-11a1-17ef95ee3344"
#    session_name = "DNS_SET_A_RECORD_SESSION"
#  }
}

data "aws_elb_hosted_zone_id" "main" {}

data "aws_route53_zone" "domain" {
  name         = var.DOMAIN
  private_zone = false
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.domain.zone_id
  name    = var.HOST
  type    = "A"
  alias {
    name                   = var.SANDBOX_PUBLIC_ADDRESS
    zone_id                = data.aws_elb_hosted_zone_id.main.id
    evaluate_target_health = true
  }
}
