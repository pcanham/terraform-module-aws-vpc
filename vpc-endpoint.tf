#
resource "aws_vpc_endpoint" "s3" {
  vpc_id = aws_vpc.pro.id
  service_name = format(
    "com.amazonaws.%s.s3",
    var.aws_region,
  )
  tags = var.tags
}

resource "aws_vpc_endpoint_route_table_association" "public_s3" {
  count          = length(var.public_cidr_blocks)
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id  = element(aws_route_table.public.*.id, count.index)
}

resource "aws_vpc_endpoint_route_table_association" "private01_s3" {
  count           = length(var.private_cidr_blocks01)
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id  = element(aws_route_table.private01.*.id, count.index)
}

resource "aws_vpc_endpoint_route_table_association" "private02_s3" {
  count           = length(var.private_cidr_blocks02)
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id  = element(aws_route_table.private02.*.id, count.index)
}

resource "aws_vpc_endpoint_route_table_association" "private03_s3" {
  count           = length(var.private_cidr_blocks03)
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id  = element(aws_route_table.private03.*.id, count.index)
}
