output "aws_region" {
  value = var.aws_region
}

output "vpc_id" {
  value = aws_vpc.pro.id
}

output "vpc_cidr" {
  value = aws_vpc.pro.cidr_block
}

output "all_subnet_ids" {
  value = concat(aws_subnet.pm_pro_public[*].id, aws_subnet.pm_pro_private01[*].id, aws_subnet.pm_pro_private02[*].id, aws_subnet.pm_pro_private03[*].id)
}

output "public_subnet_ids" {
  value = aws_subnet.pm_pro_public[*].id
}

output "private_subnet_ids" {
  value = concat(aws_subnet.pm_pro_private01[*].id, aws_subnet.pm_pro_private02[*].id, aws_subnet.pm_pro_private03[*].id)
}

output "private_subnet01_ids" {
  value = aws_subnet.pm_pro_private01[*].id
}

output "private_subnet02_ids" {
  value = aws_subnet.pm_pro_private02[*].id
}

output "private_subnet03_ids" {
  value = aws_subnet.pm_pro_private03[*].id
}

output "nat_gw_eips" {
  value = aws_eip.nat_ip[*].public_ip
}

output "public_tier_name" {
  value = aws_subnet.pm_pro_public[*].id
}

output "private01_tier_name" {
  value = var.private01_tier_name
}

output "private02_tier_name" {
  value = var.private02_tier_name
}

output "private03_tier_name" {
  value = var.private03_tier_name
}

output "public_routing_table_ids" {
  value = aws_route_table.public[*].id
}

output "private01_routing_table_ids" {
  value = aws_route_table.private01[*].id
}

output "private02_routing_table_ids" {
  value = aws_route_table.private02[*].id
}

output "private03_routing_table_ids" {
  value = aws_route_table.private03[*].id
}
