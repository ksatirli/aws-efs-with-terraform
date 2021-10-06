# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}
