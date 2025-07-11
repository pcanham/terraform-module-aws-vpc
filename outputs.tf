output "aws_region" {
  value       = var.aws_region
  description = "AWS Region being used"
}

output "vpc_id" {
  value       = aws_vpc.pro.id
  description = "AWS VPC ID"
}

output "vpc_cidr" {
  value       = aws_vpc.pro.cidr_block
  description = "CIDR Range being used by VPC"
}

output "all_subnet_ids" {
  value       = concat(aws_subnet.pm_pro_public[*].id, aws_subnet.pm_pro_private01[*].id, aws_subnet.pm_pro_private02[*].id, aws_subnet.pm_pro_private03[*].id)
  description = "List all used subnet ids"
}

output "public_subnet_ids" {
  value       = aws_subnet.pm_pro_public[*].id
  description = "List all used public subnet ids"
}

output "private_subnet_ids" {
  value       = concat(aws_subnet.pm_pro_private01[*].id, aws_subnet.pm_pro_private02[*].id, aws_subnet.pm_pro_private03[*].id, aws_subnet.pm_pro_private04[*].id)
  description = "List all used private subnet ids"
}

output "private_subnet01_ids" {
  value       = aws_subnet.pm_pro_private01[*].id
  description = "List all used private 01 subnet ids"
}

output "private_subnet02_ids" {
  value       = aws_subnet.pm_pro_private02[*].id
  description = "List all used private 02 subnet ids"
}

output "private_subnet03_ids" {
  value       = aws_subnet.pm_pro_private03[*].id
  description = "List all used private 03 subnet ids"
}

output "private_subnet04_ids" {
  value       = aws_subnet.pm_pro_private04[*].id
  description = "List all used private 04 subnet ids"
}

output "nat_gw_eips" {
  value       = aws_eip.nat_ip[*].public_ip
  description = "List all NAT Gateway Public IPs"
}

output "public_tier_name" {
  value       = var.public_tier_name
  description = "Tag being used for describing public subnet tier"
}

output "private01_tier_name" {
  value       = var.private01_tier_name
  description = "Tag being used for describing private subnet 01 tier"
}

output "private02_tier_name" {
  value       = var.private02_tier_name
  description = "Tag being used for describing private subnet 02 tier"
}

output "private03_tier_name" {
  value       = var.private03_tier_name
  description = "Tag being used for describing private subnet 03 tier"
}

output "private04_tier_name" {
  value       = var.private04_tier_name
  description = "Tag being used for describing private subnet 04 tier"
}

output "public_routing_table_ids" {
  value       = aws_route_table.public[*].id
  description = "Routing table ids for public subnets"
}

output "private01_routing_table_ids" {
  value       = aws_route_table.private01[*].id
  description = "Routing table ids for private 01 subnets"
}

output "private02_routing_table_ids" {
  value       = aws_route_table.private02[*].id
  description = "Routing table ids for private 02 subnets"
}

output "private03_routing_table_ids" {
  value       = aws_route_table.private03[*].id
  description = "Routing table ids for private 03 subnets"
}

output "private04_routing_table_ids" {
  value       = aws_route_table.private04[*].id
  description = "Routing table ids for private 04 subnets"
}
