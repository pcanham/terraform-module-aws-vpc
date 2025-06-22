# S3 Endpoint Gateway
resource "aws_vpc_endpoint" "s3" {
  count  = var.enable_vpc_s3_endpoint ? 1 : 0
  vpc_id = aws_vpc.pro.id
  service_name = format(
    "com.amazonaws.%s.s3",
    var.aws_region,
  )
  tags = merge(
    var.tags,
    { "Name" = lower(
      format(
        "vpc-endpoint-s3-%s",
        var.name,
      ),
      )
    }
  )
}

resource "aws_vpc_endpoint_route_table_association" "public_s3" {
  count           = var.enable_vpc_s3_endpoint && length(var.public_cidr_blocks) > 0 ? 1 : 0
  vpc_endpoint_id = aws_vpc_endpoint.s3[0].id
  route_table_id  = element(aws_route_table.public[*].id, count.index)
}

resource "aws_vpc_endpoint_route_table_association" "private01_s3" {
  count           = var.enable_vpc_s3_endpoint && length(var.private_cidr_blocks01) > 0 ? 1 : 0
  vpc_endpoint_id = aws_vpc_endpoint.s3[0].id
  route_table_id  = element(aws_route_table.private01[*].id, count.index)
}

resource "aws_vpc_endpoint_route_table_association" "private02_s3" {
  count           = var.enable_vpc_s3_endpoint && length(var.private_cidr_blocks02) > 0 ? 1 : 0
  vpc_endpoint_id = aws_vpc_endpoint.s3[0].id
  route_table_id  = element(aws_route_table.private02[*].id, count.index)
}

resource "aws_vpc_endpoint_route_table_association" "private03_s3" {
  count           = var.enable_vpc_s3_endpoint && length(var.private_cidr_blocks03) > 0 ? 1 : 0
  vpc_endpoint_id = aws_vpc_endpoint.s3[0].id
  route_table_id  = element(aws_route_table.private03[*].id, count.index)
}

resource "aws_vpc_endpoint_route_table_association" "private04_s3" {
  count           = var.enable_vpc_s3_endpoint && length(var.private_cidr_blocks04) > 0 ? 1 : 0
  vpc_endpoint_id = aws_vpc_endpoint.s3[0].id
  route_table_id  = element(aws_route_table.private04[*].id, count.index)
}
