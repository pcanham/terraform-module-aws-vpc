output "vpc_id" {
  value = aws_vpc.pro.id
}

output "vpc_cidr" {
  value = aws_vpc.pro.cidr_block
}

output "all_subnet_ids" {
  value = concat(aws_subnet.pm_pro_public.*.id, aws_subnet.pm_pro_private01.*.id, aws_subnet.pm_pro_private02.*.id)
}

output "public_subnet_ids" {
  value = aws_subnet.pm_pro_public.*.id
}

output "private_subnet_ids" {
  value = concat(aws_subnet.pm_pro_private01.*.id, aws_subnet.pm_pro_private02.*.id)
}

output "private_subnet01_ids" {
  value = aws_subnet.pm_pro_private01.*.id
}

output "private_subnet02_ids" {
  value = aws_subnet.pm_pro_private02.*.id
}

output "nat_gw_eips" {
  value = aws_eip.nat_ip.*.public_ip
}
