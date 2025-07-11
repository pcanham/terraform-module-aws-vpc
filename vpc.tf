resource "aws_vpc" "pro" {
  ipv4_ipam_pool_id    = var.ipv4_ipam_pool_id == "" ? null : var.ipv4_ipam_pool_id
  ipv4_netmask_length  = var.ipv4_ipam_pool_id == "" ? null : var.ipv4_netmask_length
  cidr_block           = var.ipv4_ipam_pool_id == "" ? var.master_cidr_block : null
  enable_dns_support   = var.vpc_enable_dns_support
  enable_dns_hostnames = var.vpc_enable_dns_hostnames

  tags = merge(
    var.tags,
    var.vpc_tags,
    { "Name" = lower(
      format(
        "vpc-%s-%s",
        var.name,
        var.aws_region,
      ),
      )
    },
    local.tags_k8s_values
  )
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.pro.id

  tags = merge(
    var.tags,
    { "Name" = lower(
      format(
        "def-secgrp-%s",
        var.name,
      ),
      )
    }
  )
}

resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.pro.id

  tags = merge(
    var.tags,
    { "Name" = lower(
      format(
        "igw%02d-%s",
        1,
        var.name,
      ),
      )
    }
  )
}
