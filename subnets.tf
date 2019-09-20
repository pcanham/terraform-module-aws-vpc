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
    },
    { lower(format("kubernetes.io/cluster/%s", var.eks_clustername)) = "shared" },
    { lower("kubernetes.io/role/elb") = "1" }
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
          1,
          substr(element(var.availability_zones, count.index), -1, 1),
          var.project_tag,
          var.environment_tag,
        ),
      )
    },
    { lower(format("kubernetes.io/cluster/%s", var.eks_clustername)) = "shared" },
    { lower("kubernetes.io/role/internal-elb") = "1" }
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
          2,
          substr(element(var.availability_zones, count.index), -1, 1),
          var.project_tag,
          var.environment_tag,
        ),
      )
    },
    { lower(format("kubernetes.io/cluster/%s", var.eks_clustername)) = "shared" }
  )
}

resource "aws_subnet" "pm_pro_private03" {
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
          3,
          substr(element(var.availability_zones, count.index), -1, 1),
          var.project_tag,
          var.environment_tag,
        ),
      )
    },
    { lower(format("kubernetes.io/cluster/%s", var.eks_clustername)) = "shared" }
  )
}
