resource "aws_subnet" "pm_pro_public" {
  vpc_id                  = aws_vpc.pro.id
  count                   = length(var.public_cidr_blocks)
  availability_zone       = element(var.availability_zones, count.index)
  cidr_block              = element(var.public_cidr_blocks, count.index)
  map_public_ip_on_launch = false

  tags = merge(
    local.common_tags,
    {
      "Name" = lower(
        format(
          "snpub%02d%s-%s-%s",
          1,
          substr(element(var.availability_zones, count.index), -1, 1),
          var.project_tag,
          var.environment_tag,
        ),
      )
    }
  )
}


resource "aws_subnet" "pm_pro_private01" {
  vpc_id                  = aws_vpc.pro.id
  count                   = length(var.availability_zones)
  availability_zone       = element(var.availability_zones, count.index)
  cidr_block              = element(var.private_cidr_blocks01, count.index)
  map_public_ip_on_launch = false

  tags = merge(
    local.common_tags,
    {
      "Name" = lower(
        format(
          "snprv%02d%s-%s-%s",
          count.index + 1,
          substr(element(var.availability_zones, count.index), -1, 1),
          var.project_tag,
          var.environment_tag,
        ),
      )
    },
    {
      "Subnet" = "Private01"
    }
  )
}

resource "aws_subnet" "pm_pro_private02" {
  vpc_id                  = aws_vpc.pro.id
  count                   = length(var.availability_zones)
  availability_zone       = element(var.availability_zones, count.index)
  cidr_block              = element(var.private_cidr_blocks02, count.index)
  map_public_ip_on_launch = false

  tags = merge(
    local.common_tags,
    {
      "Name" = lower(
        format(
          "snprv%02d%s-%s-%s",
          count.index + 1,
          substr(element(var.availability_zones, count.index), -1, 1),
          var.project_tag,
          var.environment_tag,
        ),
      )
    },
    {
      "Subnet" = "Private02"
    }
  )
}
