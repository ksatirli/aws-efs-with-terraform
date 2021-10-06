# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc
data "aws_vpc" "default" {
  default = true
}

# the for_each in this resource creates an output akin to:
#
#  {
#   "a" = {
#     "id" = "subnet-0ca...b8a"
#   }
#
#   "b" = {
#     "id" = "subnet-0ca...b8a"
#   }
#
#   "c" = {
#     "id" = "subnet-0ca...b8a"
#   }
# }
#
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet
data "aws_subnet" "default" {
  for_each = toset(var.subnet_az)

  availability_zone = "${var.aws_region}${each.key}"
  default_for_az    = true
  vpc_id            = data.aws_vpc.default.id
}
