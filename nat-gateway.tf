locals {
  nat_gateway_count = var.nat_gateway ? (var.single_nat_gateway ? 1 : var.one_nat_gateway_per_az ? length(var.availability_zones) : 0) : 0
}


resource "aws_eip" "nat_ip" {
  #checkov:skip=CKV2_AWS_19:Elastic IP (EIP) being assigned to NAT Gateway
  count  = local.nat_gateway_count
  domain = "vpc"

  tags = merge(
    var.nat_gateway_tags,
    var.tags,
    { "Name" = lower(
      format(
        "ngw-eip%02d-%s",
        count.index + 1,
        var.name,
      ),
      )
    }
  )
}

resource "aws_nat_gateway" "nat_gw" {
  count         = local.nat_gateway_count
  allocation_id = element(aws_eip.nat_ip[*].id, count.index)
  subnet_id     = element(aws_subnet.pm_pro_public[*].id, count.index)
  depends_on    = [aws_internet_gateway.internet_gw]

  tags = merge(
    var.nat_gateway_tags,
    var.tags,
    { "Name" = lower(
      format(
        "ngw%02d%s-%s",
        count.index + 1,
        substr(var.availability_zones[count.index], -1, 1),
        var.name,
      ),
      )
    },
    {
      "SERVICE" = "VPC"
    }
  )
}
