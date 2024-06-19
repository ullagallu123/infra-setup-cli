data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.environment}/vpc-id"
}
resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project_name}/${var.environment}/sg-id"
  type  = "String"
  value = module.expense_sg.sg_id
}

module "expense_sg" {
  source         = "git::https://github.com/ullagallu123/sg.git"
  project_name   = "ugl"
  environment    = "test"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_description = "This sg is used to allow tcp connections"
  ingress_rules = [{
    description = "allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }]

  common_tags = {
    "Terraform"   = true
    "Project"     = "K"
    "Environment" = "Test"
    "Developer"   = "Siva"
    "Module"      = "VPC"
  }
}