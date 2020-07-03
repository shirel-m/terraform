
variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_ACCESS" {
}

variable "RG_NAME" {
}

variable "BUCKET_NAME" {
}

variable "SANDBOX_ID" {
}

# =======================================================================

provider "azurerm" {
  version = "=1.35.0"   # the earliest version we support for msi
}

provider "aws" {
  region = "eu-west-1"
  access_key = var.AWS_ACCESS_KEY == "none" ? "" : var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_ACCESS == "none" ? "" : var.AWS_SECRET_ACCESS
}

# =======================================================================

# create a resource group on azure

resource "azurerm_resource_group" "rg" {
  name = "${var.RG_NAME}"
  location = "West Europe"
}

# create a file in bucket it aws

resource "aws_s3_bucket_object" "object" {
  bucket  = "${var.BUCKET_NAME}"
  key     = "${var.SANDBOX_ID}.json"
  acl     = "bucket-owner-full-control"
  content = <<EOF
SANDBOX_ID:${var.SANDBOX_ID}
EOF
}


# =======================================================================

output "RG_ID" {
  value = "${azurerm_resource_group.rg.id}"
}
