# S3 Endpoint Gateway
resource "aws_vpc_endpoint" "s3" {
  count       = var.enable_vpc_s3_endpoint ? 1 : 0
  vpc_id      = aws_vpc.main.id
  policy      = var.vpc_s3_endpoint_policy
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
  route_table_id  = aws_route_table.public.id
}

resource "aws_vpc_endpoint_route_table_association" "private01_s3" {
  for_each        = var.enable_vpc_s3_endpoint ? local.private01_subnets : {}
  vpc_endpoint_id = aws_vpc_endpoint.s3[0].id
  route_table_id  = aws_route_table.private01[each.key].id
}

resource "aws_vpc_endpoint_route_table_association" "private02_s3" {
  for_each        = var.enable_vpc_s3_endpoint ? local.private02_subnets : {}
  vpc_endpoint_id = aws_vpc_endpoint.s3[0].id
  route_table_id  = aws_route_table.private02[each.key].id
}

resource "aws_vpc_endpoint_route_table_association" "private03_s3" {
  for_each        = var.enable_vpc_s3_endpoint ? local.private03_subnets : {}
  vpc_endpoint_id = aws_vpc_endpoint.s3[0].id
  route_table_id  = aws_route_table.private03[each.key].id
}

resource "aws_vpc_endpoint_route_table_association" "private04_s3" {
  for_each        = var.enable_vpc_s3_endpoint ? local.private04_subnets : {}
  vpc_endpoint_id = aws_vpc_endpoint.s3[0].id
  route_table_id  = aws_route_table.private04[each.key].id
}
