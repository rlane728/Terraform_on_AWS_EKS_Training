# Define Local Values in Terraform
locals {
  owners = var.business_divsion
  environment = var.environment
  name = "${var.business_divsion}-${var.environment}"
  #name = "${local.owners}-${local.environment}" #<---You can combine other declared locals
  common_tags = {  #<----This is a map
    owners = local.owners
    environment = local.environment
  }
} 