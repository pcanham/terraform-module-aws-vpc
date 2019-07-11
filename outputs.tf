output "vpcid" {
  value = aws_vpc.pro.id
}

output "VpcCidr" {
  value = aws_vpc.pro.cidr_block
}

output "Public-SubnetIds" {
  value = [aws_subnet.pm_pro_public.*.id]
}

output "Private-SubnetIds" {
  value = [aws_subnet.pm_pro_private01.*.id, aws_subnet.pm_pro_private02.*.id]
}

output "Private-Subnet01Ids" {
  value = [aws_subnet.pm_pro_private01.*.id]
}

output "Private-Subnet02Ids" {
  value = [aws_subnet.pm_pro_private02.*.id]
}

output "nat-gw-eips" {
  value = [aws_eip.nat_ip.*.public_ip]
}
