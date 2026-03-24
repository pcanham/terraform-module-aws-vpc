locals {
  # Determine which NAT Gateways to create based on configuration
  # Creates a map with string keys matching the public subnet indices
  nat_gateways_map = var.nat_gateway ? (
    var.single_nat_gateway ? {
      "0" = local.public_subnets[0]
    } : (
      var.one_nat_gateway_per_az ? local.public_subnets : {}
    )
  ) : {}
}


resource "aws_eip" "nat_ip" {
  #checkov:skip=CKV2_AWS_19:Elastic IP (EIP) being assigned to NAT Gateway
  for_each = local.nat_gateways_map
  domain   = "vpc"

  tags = merge(
    var.nat_gateway_tags,
    var.tags,
    { "Name" = lower(
      format(
        "ngw-eip%02d-%s",
        tonumber(each.key) + 1,
        var.name,
      ),
      )
    }
  )
}

resource "aws_nat_gateway" "nat_gw" {
  for_each      = local.nat_gateways_map
  allocation_id = aws_eip.nat_ip[each.key].id
  subnet_id     = aws_subnet.public[each.key].id
  depends_on    = [aws_internet_gateway.internet_gw]

  tags = merge(
    var.nat_gateway_tags,
    var.tags,
    { "Name" = lower(
      format(
        "ngw%02d%s-%s",
        tonumber(each.key) + 1,
        substr(each.value.az, -1, 1),
        var.name,
      ),
      )
    },
    {
      "SERVICE" = "VPC"
    }
  )
}
