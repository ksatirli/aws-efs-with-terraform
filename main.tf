variable "filesystem_names" {
  type = list(string)
  default = [
    "some_machine",
    "the_other_machine",
    "also_a_machine"
  ]
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_file_system
resource "aws_efs_file_system" "storage" {
  for_each = toset(var.filesystem_names)

  creation_token = "${var.env}_${each.key}"

  tags = {
    # add Name tag to make it easier to find the right resource in the UI
    Name = "${var.env}_${each.key}"
  }
}

