output "aws_region" {
  value       = var.aws_region
  description = "AWS Region being used"
}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "AWS VPC ID"
}

output "vpc_cidr" {
  value       = aws_vpc.main.cidr_block
  description = "CIDR Range being used by VPC"
}

output "all_subnet_ids" {
  value = concat(
    values(aws_subnet.public)[*].id,
    values(aws_subnet.private01)[*].id,
    values(aws_subnet.private02)[*].id,
    values(aws_subnet.private03)[*].id,
    values(aws_subnet.private04)[*].id
  )
  description = "List all used subnet ids"
}

output "public_subnet_ids" {
  value       = values(aws_subnet.public)[*].id
  description = "List all used public subnet ids"
}

output "private_subnet_ids" {
  value = concat(
    values(aws_subnet.private01)[*].id,
    values(aws_subnet.private02)[*].id,
    values(aws_subnet.private03)[*].id,
    values(aws_subnet.private04)[*].id
  )
  description = "List all used private subnet ids"
}

output "private_subnet01_ids" {
  value       = values(aws_subnet.private01)[*].id
  description = "List all used private 01 subnet ids"
}

output "private_subnet02_ids" {
  value       = values(aws_subnet.private02)[*].id
  description = "List all used private 02 subnet ids"
}

output "private_subnet03_ids" {
  value       = values(aws_subnet.private03)[*].id
  description = "List all used private 03 subnet ids"
}

output "private_subnet04_ids" {
  value       = values(aws_subnet.private04)[*].id
  description = "List all used private 04 subnet ids"
}

output "nat_gw_eips" {
  value       = values(aws_eip.nat_ip)[*].public_ip
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
  value       = [aws_route_table.public.id]
  description = "Routing table ids for public subnets"
}

output "private01_routing_table_ids" {
  value       = values(aws_route_table.private01)[*].id
  description = "Routing table ids for private 01 subnets"
}

output "private02_routing_table_ids" {
  value       = values(aws_route_table.private02)[*].id
  description = "Routing table ids for private 02 subnets"
}

output "private03_routing_table_ids" {
  value       = values(aws_route_table.private03)[*].id
  description = "Routing table ids for private 03 subnets"
}

output "private04_routing_table_ids" {
  value       = values(aws_route_table.private04)[*].id
  description = "Routing table ids for private 04 subnets"
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.internet_gw.id
  description = "ID of the Internet Gateway"
}

output "default_security_group_id" {
  value       = aws_default_security_group.default.id
  description = "ID of the default security group"
}

output "vpc_flow_log_accept_id" {
  value       = aws_flow_log.VpcFlowLog-Accept.id
  description = "ID of the VPC Flow Log for accepted traffic"
}

output "vpc_flow_log_reject_id" {
  value       = aws_flow_log.VpcFlowLog-Reject.id
  description = "ID of the VPC Flow Log for rejected traffic"
}

output "vpc_flow_log_accept_cloudwatch_log_group_arn" {
  value       = aws_cloudwatch_log_group.LogGroup-Accept.arn
  description = "ARN of the CloudWatch Log Group for accepted VPC Flow Logs"
}

output "vpc_flow_log_reject_cloudwatch_log_group_arn" {
  value       = aws_cloudwatch_log_group.LogGroup-Reject.arn
  description = "ARN of the CloudWatch Log Group for rejected VPC Flow Logs"
}

output "dhcp_options_id" {
  value       = aws_vpc_dhcp_options.dhcp_options.id
  description = "ID of the DHCP Options Set"
}

output "vpc_s3_endpoint_id" {
  value       = var.enable_vpc_s3_endpoint ? aws_vpc_endpoint.s3[0].id : null
  description = "ID of the S3 VPC Endpoint (if enabled)"
}

output "vpc_encryption_control_id" {
  value       = var.enable_vpc_encryption_control ? aws_vpc_encryption_control.this[0].id : null
  description = "ID of the VPC encryption control (if enabled)"
}

output "vpc_encryption_control_mode" {
  value       = var.enable_vpc_encryption_control ? aws_vpc_encryption_control.this[0].mode : null
  description = "Mode of the VPC encryption control (if enabled)"
}
