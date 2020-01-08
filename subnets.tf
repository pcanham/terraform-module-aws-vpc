resource "aws_subnet" "pm_pro_public" {
  vpc_id                  = aws_vpc.pro.id
  count                   = length(var.public_cidr_blocks)
  availability_zone       = element(var.availability_zones, count.index)
  cidr_block              = element(var.public_cidr_blocks, count.index)
  map_public_ip_on_launch = false

  tags = merge(
    var.tags,
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
    },
    locals.tags_k8s_values,
    locals.tags_k8s_role_elb_values
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
    {
      "Name" = lower(
        format(
          "snprv%02d%s-%s-%s",
          1,
          substr(element(var.availability_zones, count.index), -1, 1),
          var.project_tag,
          var.environment_tag,
        ),
      )
    },
    locals.tags_k8s_values
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
    {
      "Name" = lower(
        format(
          "snprv%02d%s-%s-%s",
          2,
          substr(element(var.availability_zones, count.index), -1, 1),
          var.project_tag,
          var.environment_tag,
        ),
      )
    },
    locals.tags_k8s_values
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
    {
      "Name" = lower(
        format(
          "snprv%02d%s-%s-%s",
          3,
          substr(element(var.availability_zones, count.index), -1, 1),
          var.project_tag,
          var.environment_tag,
        ),
      )
    },
    locals.tags_k8s_values
  )
}
