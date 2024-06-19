resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project_name}/${var.environment}/vpc-id"
  type  = "String"
  value = module.expense_vpc.vpc_id
}
resource "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/public-subnets-ids"
  type  = "StringList"
  value = join(",", module.expense_vpc.public_subnets_ids)
}

resource "aws_ssm_parameter" "private_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/private-subnet-ids"
  type  = "StringList"
  value = join(",", module.expense_vpc.private_subnets_ids)
}

resource "aws_ssm_parameter" "db_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/db-subnet-ids"
  type  = "StringList"
  value = join(",", module.expense_vpc.db_subnets_ids)
}