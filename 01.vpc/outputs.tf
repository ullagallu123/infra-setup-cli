output "vpc_id" {
  value = module.expense_vpc.vpc_id
}
output "public_subnets_ids" {
  value = module.expense_vpc.public_subnets_ids
}
output "private_subnets_ids" {
  value = module.expense_vpc.private_subnets_ids
}
output "db_subnets_ids" {
  value = module.expense_vpc.db_subnets_ids
}