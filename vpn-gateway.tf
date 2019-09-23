resource "aws_vpn_gateway" "vpn_gateway" {
  count  = var.create_vpn ? 1 : 0
  vpc_id = aws_vpc.pro.id
  tags   = var.tags
}

resource "aws_customer_gateway" "customer_gateway" {
  count      = var.create_vpn ? 1 : 0
  bgp_asn    = 65000
  ip_address = var.customergateway_ip
  type       = "ipsec.1"

  tags = merge(
    var.tags,
    { "Name" = lower(
      format(
        "cgw-%s-%s-%s",
        var.customergateway_name,
        var.project_tag,
        var.environment_tag,
      ),
      )
    }
  )
}

resource "aws_vpn_connection" "main" {
  count               = var.create_vpn ? 1 : 0
  vpn_gateway_id      = aws_vpn_gateway.vpn_gateway[0].id
  customer_gateway_id = aws_customer_gateway.customer_gateway[0].id
  type                = "ipsec.1"
  static_routes_only  = true

  tags = merge(
    var.tags,
    { "Name" = lower(
      format(
        "vpn-%s-%s-%s",
        var.customergateway_name,
        var.project_tag,
        var.environment_tag,
      ),
      )
    }
  )
}

resource "aws_vpn_connection_route" "office" {
  count                  = var.create_vpn ? length(var.vpn_cidr_block) : 0
  destination_cidr_block = element(var.vpn_cidr_block, count.index)
  vpn_connection_id      = aws_vpn_connection.main[0].id
}
