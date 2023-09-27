resource "aws_vpc" "main" {
  cidr_block           = var.master_cidr_block
  enable_dns_support   = var.vpc_enable_dns_support
  enable_dns_hostnames = var.vpc_enable_dns_hostnames

  tags = merge(
    var.tags,
    var.vpc_tags,
    { "Name" = lower(
      format(
        "vpc-%s-%s-%s",
        var.project_tag,
        var.environment_tag,
        var.aws_region,
      ),
      )
    },
    local.tags_k8s_values
  )
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.tags,
    { "Name" = lower(
      format(
        "def-secgrp-%s-%s",
        var.project_tag,
        var.environment_tag,
      ),
      )
    }
  )
}

resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.tags,
    { "Name" = lower(
      format(
        "igw%02d-%s-%s",
        1,
        var.project_tag,
        var.environment_tag,
      ),
      )
    }
  )
}
