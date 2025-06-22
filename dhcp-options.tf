resource "aws_vpc_dhcp_options" "dhcp_options" {
  domain_name          = var.dhcp_domain_name
  domain_name_servers  = var.dhcp_domain_name_servers
  ntp_servers          = var.dhcp_ntp_servers
  netbios_name_servers = var.dhcp_netbios_name_servers
  netbios_node_type    = var.dhcp_netbios_node_type

  tags = merge(
    var.tags,
    { "Name" = lower(
      format(
        "dhcp-opts-%s",
        var.name,
      ),
      )
    }
  )
}

resource "aws_vpc_dhcp_options_association" "dhcp_options" {
  vpc_id          = aws_vpc.pro.id
  dhcp_options_id = aws_vpc_dhcp_options.dhcp_options.id
}
