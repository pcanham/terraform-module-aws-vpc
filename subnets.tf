locals {
  public_subnets = { for idx, cidr in var.public_cidr_blocks : idx => {
    cidr = cidr
    az   = var.availability_zones[idx]
  } }

  private01_subnets = { for idx, cidr in var.private_cidr_blocks01 : idx => {
    cidr = cidr
    az   = var.availability_zones[idx]
  } }

  private02_subnets = { for idx, cidr in var.private_cidr_blocks02 : idx => {
    cidr = cidr
    az   = var.availability_zones[idx]
  } }

  private03_subnets = { for idx, cidr in var.private_cidr_blocks03 : idx => {
    cidr = cidr
    az   = var.availability_zones[idx]
  } }

  private04_subnets = { for idx, cidr in var.private_cidr_blocks04 : idx => {
    cidr = cidr
    az   = var.availability_zones[idx]
  } }
}

resource "aws_subnet" "public" {
  for_each                = local.public_subnets
  vpc_id                  = aws_vpc.main.id
  availability_zone       = each.value.az
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = false

  tags = merge(
    var.tags,
    var.public_subnet_tags,
    {
      "Name" = lower(
        format(
          "snpub%02d%s-%s",
          1,
          substr(each.value.az, -1, 1),
          var.name,
        ),
      )
    },
    {
      "Tier" = var.public_tier_name
    },
    local.tags_k8s_values,
    local.tags_k8s_role_elb_values
  )
}

resource "aws_subnet" "private01" {
  for_each                = local.private01_subnets
  vpc_id                  = aws_vpc.main.id
  availability_zone       = each.value.az
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = false

  tags = merge(
    var.tags,
    var.private_subnet_tags,
    var.private01_subnet_tags,
    {
      "Name" = lower(
        format(
          "snprv%02d%s-%s",
          1,
          substr(each.value.az, -1, 1),
          var.name,
        ),
      )
    },
    {
      "Tier" = var.private01_tier_name
    },
    local.tags_k8s_values
  )
}

resource "aws_subnet" "private02" {
  for_each                = local.private02_subnets
  vpc_id                  = aws_vpc.main.id
  availability_zone       = each.value.az
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = false

  tags = merge(
    var.tags,
    var.private_subnet_tags,
    var.private02_subnet_tags,
    {
      "Name" = lower(
        format(
          "snprv%02d%s-%s",
          2,
          substr(each.value.az, -1, 1),
          var.name,
        ),
      )
    },
    {
      "Tier" = var.private02_tier_name
    },
    local.tags_k8s_values
  )
}

resource "aws_subnet" "private03" {
  for_each                = local.private03_subnets
  vpc_id                  = aws_vpc.main.id
  availability_zone       = each.value.az
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = false

  tags = merge(
    var.tags,
    var.private_subnet_tags,
    var.private03_subnet_tags,
    {
      "Name" = lower(
        format(
          "snprv%02d%s-%s",
          3,
          substr(each.value.az, -1, 1),
          var.name,
        ),
      )
    },
    {
      "Tier" = var.private03_tier_name
    },
    local.tags_k8s_values
  )
}

resource "aws_subnet" "private04" {
  for_each                = local.private04_subnets
  vpc_id                  = aws_vpc.main.id
  availability_zone       = each.value.az
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = false

  tags = merge(
    var.tags,
    var.private_subnet_tags,
    var.private04_subnet_tags,
    {
      "Name" = lower(
        format(
          "snprv%02d%s-%s",
          4,
          substr(each.value.az, -1, 1),
          var.name,
        ),
      )
    },
    {
      "Tier" = var.private04_tier_name
    },
    local.tags_k8s_values
  )
}
