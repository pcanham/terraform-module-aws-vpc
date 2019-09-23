resource "aws_eip" "nat_ip" {
  count = var.nat_gateway ? length(var.public_cidr_blocks) : 0
  vpc   = true

  tags = merge(
    var.tags,
    { "Name" = lower(
      format(
        "ngw-eip%02d-%s-%s",
        count.index + 1,
        var.project_tag,
        var.environment_tag,
      ),
      )
    }
  )
}

resource "aws_nat_gateway" "nat_gw" {
  count         = var.nat_gateway ? length(var.public_cidr_blocks) : 0
  allocation_id = element(aws_eip.nat_ip.*.id, count.index)
  subnet_id     = element(aws_subnet.pm_pro_public.*.id, count.index)
  depends_on    = ["aws_internet_gateway.internet_gw"]

  tags = merge(
    var.tags,
    { "Name" = lower(
      format(
        "ngw%02d%s-%s-%s",
        count.index + 1,
        substr(var.availability_zones[count.index], -1, 1),
        var.project_tag,
        var.environment_tag,
      ),
      )
    }
  )
}
