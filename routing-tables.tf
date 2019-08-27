resource "aws_route_table" "public" {
  vpc_id = aws_vpc.pro.id
  count  = length(var.availability_zones)

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gw.id
  }

  tags = merge(
    local.common_tags,
    { "Name" = lower(
      format(
        "rtpub%02d-%s-%s",
        count.index + 1,
        var.project_tag,
        var.environment_tag,
      ),
      )
    }
    #    { "Name" = "${lower(format("rtpub%02d-%s-%s", 1, var.project_tag, var.environment_tag))}" }
  )

}

resource "aws_route_table" "private01" {
  vpc_id = aws_vpc.pro.id
  count  = length(var.availability_zones)

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.nat_gateway ? element(concat(aws_nat_gateway.nat_gw.*.id, list("")), count.index) : aws_internet_gateway.internet_gw.id
    #gateway_id = "${length(aws_nat_gateway.nat_gw.*.id) > 0 ? element(concat(aws_nat_gateway.nat_gw.*.id, list("")), count.index) : aws_internet_gateway.internet_gw.id}"
    #gateway_id = "${aws_internet_gateway.internet_gw.id}"
  }

  tags = merge(
    local.common_tags,
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
    #    { "Name" = "${lower(format("rtprv%02d%s-%s-%s", 98, substr(element(var.availability_zones,count.index), -1, 1), var.project_tag, var.environment_tag))}" }
  )
}

resource "aws_route_table" "private02" {
  vpc_id = aws_vpc.pro.id
  count  = length(var.availability_zones)

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.nat_gateway ? element(concat(aws_nat_gateway.nat_gw.*.id, list("")), count.index) : aws_internet_gateway.internet_gw.id
    #gateway_id = "${length(aws_nat_gateway.nat_gw.*.id) > 0 ? element(concat(aws_nat_gateway.nat_gw.*.id, list("")), count.index) : aws_internet_gateway.internet_gw.id}"
    #gateway_id = "${aws_internet_gateway.internet_gw.id}"
  }

  tags = merge(
    local.common_tags,
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
    #    { "Name" = "${lower(format("rtprv%02d%s-%s-%s", 98, substr(element(var.availability_zones,count.index), -1, 1), var.project_tag, var.environment_tag))}" }
  )
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
