output "vpcid" {
  value = aws_vpc.pro.id
}

output "vpccidr" {
  value = aws_vpc.pro.cidr_block
}

output "all_subnetids" {
  value = [aws_subnet.pm_pro_public.*.id, aws_subnet.pm_pro_private01.*.id, aws_subnet.pm_pro_private02.*.id]
}

output "public_subnetids" {
  value = [aws_subnet.pm_pro_public.*.id]
}

output "private_subnetids" {
  value = [aws_subnet.pm_pro_private01.*.id, aws_subnet.pm_pro_private02.*.id]
}

output "private_subnet01ids" {
  value = [aws_subnet.pm_pro_private01.*.id]
}

output "private_subnet02ids" {
  value = [aws_subnet.pm_pro_private02.*.id]
}

output "nat_gw_eips" {
  value = [aws_eip.nat_ip.*.public_ip]
}
