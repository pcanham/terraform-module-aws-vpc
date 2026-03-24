resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gw.id
  }

  tags = merge(
    var.tags,
    var.public_routing_tables_tags,
    { "Name" = lower(
      format(
        "rtpub-%s",
        var.name,
      ),
      )
    },
    {
      "Tier" = var.public_tier_name
    }
  )

}

resource "aws_route_table" "private01" {
  for_each = local.private01_subnets
  vpc_id   = aws_vpc.main.id

  tags = merge(
    var.tags,
    var.private_routing_tables_tags,
    var.private01_routing_tables_tags,
    { "Name" = lower(
      format(
        "rtprv%02d%s-%s",
        1,
        substr(each.value.az, -1, 1),
        var.name,
      ),
      )
    },
    {
      "Tier" = var.private01_tier_name
    }
  )

  lifecycle {
    # When attaching VPN gateways it is common to define aws_vpn_gateway_route_propagation
    # resources that manipulate the attributes of the routing table (typically for the private subnets)
    ignore_changes = [propagating_vgws]
  }
}

resource "aws_route" "private01_ngw" {
  for_each = var.nat_gateway ? local.private01_subnets : {}

  route_table_id         = aws_route_table.private01[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.single_nat_gateway ? aws_nat_gateway.nat_gw["0"].id : aws_nat_gateway.nat_gw[each.key].id
}

resource "aws_route_table" "private02" {
  for_each = local.private02_subnets
  vpc_id   = aws_vpc.main.id

  tags = merge(
    var.tags,
    var.private_routing_tables_tags,
    var.private02_routing_tables_tags,
    { "Name" = lower(
      format(
        "rtprv%02d%s-%s",
        2,
        substr(each.value.az, -1, 1),
        var.name,
      ),
      )
    },
    {
      "Tier" = var.private02_tier_name
    }
  )

  lifecycle {
    # When attaching VPN gateways it is common to define aws_vpn_gateway_route_propagation
    # resources that manipulate the attributes of the routing table (typically for the private subnets)
    ignore_changes = [propagating_vgws]
  }
}

resource "aws_route" "private02_ngw" {
  for_each = var.nat_gateway ? local.private02_subnets : {}

  route_table_id         = aws_route_table.private02[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.single_nat_gateway ? aws_nat_gateway.nat_gw["0"].id : aws_nat_gateway.nat_gw[each.key].id
}

resource "aws_route_table" "private03" {
  for_each = local.private03_subnets
  vpc_id   = aws_vpc.main.id

  tags = merge(
    var.tags,
    var.private_routing_tables_tags,
    var.private03_routing_tables_tags,
    { "Name" = lower(
      format(
        "rtprv%02d%s-%s",
        3,
        substr(each.value.az, -1, 1),
        var.name,
      ),
      )
    },
    {
      "Tier" = var.private03_tier_name
    }
  )

  lifecycle {
    # When attaching VPN gateways it is common to define aws_vpn_gateway_route_propagation
    # resources that manipulate the attributes of the routing table (typically for the private subnets)
    ignore_changes = [propagating_vgws]
  }
}

resource "aws_route" "private03_ngw" {
  for_each = var.nat_gateway ? local.private03_subnets : {}

  route_table_id         = aws_route_table.private03[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.single_nat_gateway ? aws_nat_gateway.nat_gw["0"].id : aws_nat_gateway.nat_gw[each.key].id
}

resource "aws_route_table" "private04" {
  for_each = local.private04_subnets
  vpc_id   = aws_vpc.main.id

  tags = merge(
    var.tags,
    var.private_routing_tables_tags,
    var.private04_routing_tables_tags,
    { "Name" = lower(
      format(
        "rtprv%02d%s-%s",
        4,
        substr(each.value.az, -1, 1),
        var.name,
      ),
      )
    },
    {
      "Tier" = var.private04_tier_name
    }
  )

  lifecycle {
    # When attaching VPN gateways it is common to define aws_vpn_gateway_route_propagation
    # resources that manipulate the attributes of the routing table (typically for the private subnets)
    ignore_changes = [propagating_vgws]
  }
}

resource "aws_route" "private04_ngw" {
  for_each = var.nat_gateway ? local.private04_subnets : {}

  route_table_id         = aws_route_table.private04[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.single_nat_gateway ? aws_nat_gateway.nat_gw["0"].id : aws_nat_gateway.nat_gw[each.key].id
}

resource "aws_route_table_association" "public" {
  for_each       = local.public_subnets
  subnet_id      = aws_subnet.public[each.key].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private01" {
  for_each       = local.private01_subnets
  subnet_id      = aws_subnet.private01[each.key].id
  route_table_id = aws_route_table.private01[each.key].id
}

resource "aws_route_table_association" "private02" {
  for_each       = local.private02_subnets
  subnet_id      = aws_subnet.private02[each.key].id
  route_table_id = aws_route_table.private02[each.key].id
}

resource "aws_route_table_association" "private03" {
  for_each       = local.private03_subnets
  subnet_id      = aws_subnet.private03[each.key].id
  route_table_id = aws_route_table.private03[each.key].id
}

resource "aws_route_table_association" "private04" {
  for_each       = local.private04_subnets
  subnet_id      = aws_subnet.private04[each.key].id
  route_table_id = aws_route_table.private04[each.key].id
}
