resource "aws_route_table" "public" {
  vpc_id = aws_vpc.pro.id
  count  = length(var.public_cidr_blocks)

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gw.id
  }

  tags = merge(
    var.tags,
    { "Name" = lower(
      format(
        "rtpub%02d-%s-%s",
        count.index + 1,
        var.project_tag,
        var.environment_tag,
      ),
      )
    }
  )

}

resource "aws_route_table" "private01" {
  vpc_id = aws_vpc.pro.id
  count  = length(var.private_cidr_blocks01)

  tags = merge(
    var.tags,
    { "Name" = lower(
      format(
        "rtprv%02d%s-%s-%s",
        1,
        substr(element(var.availability_zones, count.index), -1, 1),
        var.project_tag,
        var.environment_tag,
      ),
      )
    }
  )

  lifecycle {
    # When attaching VPN gateways it is common to define aws_vpn_gateway_route_propagation
    # resources that manipulate the attributes of the routing table (typically for the private subnets)
    ignore_changes = [propagating_vgws]
  }
}

resource "aws_route" "private01_ngw" {
  count = var.nat_gateway ? length(var.private_cidr_blocks01) : 0

  route_table_id         = aws_route_table.private01[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.single_nat_gateway ? aws_nat_gateway.nat_gw[0].id : element(aws_nat_gateway.nat_gw.*.id, count.index)
}

resource "aws_route_table" "private02" {
  vpc_id = aws_vpc.pro.id
  count  = length(var.private_cidr_blocks02)

  tags = merge(
    var.tags,
    { "Name" = lower(
      format(
        "rtprv%02d%s-%s-%s",
        2,
        substr(element(var.availability_zones, count.index), -1, 1),
        var.project_tag,
        var.environment_tag,
      ),
      )
    }
  )

  lifecycle {
    # When attaching VPN gateways it is common to define aws_vpn_gateway_route_propagation
    # resources that manipulate the attributes of the routing table (typically for the private subnets)
    ignore_changes = [propagating_vgws]
  }
}

resource "aws_route" "private02_ngw" {
  count = var.nat_gateway ? length(var.private_cidr_blocks02) : 0

  route_table_id         = aws_route_table.private02[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.single_nat_gateway ? aws_nat_gateway.nat_gw[0].id : element(aws_nat_gateway.nat_gw.*.id, count.index)
}

resource "aws_route_table" "private03" {
  vpc_id = aws_vpc.pro.id
  count  = length(var.private_cidr_blocks03)

  tags = merge(
    var.tags,
    { "Name" = lower(
      format(
        "rtprv%02d%s-%s-%s",
        3,
        substr(element(var.availability_zones, count.index), -1, 1),
        var.project_tag,
        var.environment_tag,
      ),
      )
    }
  )

  lifecycle {
    # When attaching VPN gateways it is common to define aws_vpn_gateway_route_propagation
    # resources that manipulate the attributes of the routing table (typically for the private subnets)
    ignore_changes = [propagating_vgws]
  }
}

resource "aws_route" "private03_ngw" {
  count = var.nat_gateway ? length(var.private_cidr_blocks03) : 0

  route_table_id         = aws_route_table.private03[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.single_nat_gateway ? aws_nat_gateway.nat_gw[0].id : element(aws_nat_gateway.nat_gw.*.id, count.index)
}

resource "aws_route_table_association" "public" {
  count          = length(var.public_cidr_blocks)
  subnet_id      = element(aws_subnet.pm_pro_public.*.id, count.index)
  route_table_id = element(aws_route_table.public.*.id, count.index)
}

resource "aws_route_table_association" "private01" {
  count          = length(var.private_cidr_blocks01)
  subnet_id      = element(aws_subnet.pm_pro_private01.*.id, count.index)
  route_table_id = element(aws_route_table.private01.*.id, count.index)
}

resource "aws_route_table_association" "private02" {
  count          = length(var.private_cidr_blocks02)
  subnet_id      = element(aws_subnet.pm_pro_private02.*.id, count.index)
  route_table_id = element(aws_route_table.private02.*.id, count.index)
}

resource "aws_route_table_association" "private03" {
  count          = length(var.private_cidr_blocks03)
  subnet_id      = element(aws_subnet.pm_pro_private03.*.id, count.index)
  route_table_id = element(aws_route_table.private03.*.id, count.index)
}