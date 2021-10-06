# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#profile
variable "aws_profile" {
  type        = string
  description = "This is the AWS profile name as set in the shared credentials file."
  default     = "hashicorp"
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#region
variable "aws_region" {
  type        = string
  description = "This is the AWS region."
  default     = "eu-west-1"
}

variable "subnet_az" {
  type        = list(string)
  description = "List of strings of Availability Zone suffixes."

  default = [
    "a",
    "b",
    "c"
  ]
}

variable "env" {
  type        = string
  description = "Customer Environment."
  default     = "test"
}
