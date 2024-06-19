variable "project_name" {
  default = "ugl"
}

variable "environment" {
  default = "test"
}
variable "sg_description" {
  default = ""
}
variable "common_tags" {
  default = {}
}
variable "sg_tags" {
  default = {}
}

variable "vpc_id" {
  default = ""
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}
