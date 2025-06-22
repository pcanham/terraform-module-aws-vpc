resource "aws_subnet" "pm_pro_public" {
  vpc_id                  = aws_vpc.pro.id
  count                   = length(var.public_cidr_blocks)
  availability_zone       = element(var.availability_zones, count.index)
  cidr_block              = element(var.public_cidr_blocks, count.index)
  map_public_ip_on_launch = false

  tags = merge(
    var.tags,
    var.public_subnet_tags,
    {
      "Name" = lower(
        format(
          "snpub%02d%s-%s",
          1,
          substr(element(var.availability_zones, count.index), -1, 1),
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

resource "aws_subnet" "pm_pro_private01" {
  vpc_id                  = aws_vpc.pro.id
  count                   = length(var.private_cidr_blocks01)
  availability_zone       = element(var.availability_zones, count.index)
  cidr_block              = element(var.private_cidr_blocks01, count.index)
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
          substr(element(var.availability_zones, count.index), -1, 1),
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

resource "aws_subnet" "pm_pro_private02" {
  vpc_id                  = aws_vpc.pro.id
  count                   = length(var.private_cidr_blocks02)
  availability_zone       = element(var.availability_zones, count.index)
  cidr_block              = element(var.private_cidr_blocks02, count.index)
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
          substr(element(var.availability_zones, count.index), -1, 1),
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

resource "aws_subnet" "pm_pro_private03" {
  vpc_id                  = aws_vpc.pro.id
  count                   = length(var.private_cidr_blocks03)
  availability_zone       = element(var.availability_zones, count.index)
  cidr_block              = element(var.private_cidr_blocks03, count.index)
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
          substr(element(var.availability_zones, count.index), -1, 1),
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

resource "aws_subnet" "pm_pro_private04" {
  vpc_id                  = aws_vpc.pro.id
  count                   = length(var.private_cidr_blocks04)
  availability_zone       = element(var.availability_zones, count.index)
  cidr_block              = element(var.private_cidr_blocks04, count.index)
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
          substr(element(var.availability_zones, count.index), -1, 1),
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
