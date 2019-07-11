resource "aws_vpc" "pro" {
  cidr_block           = var.master_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true


  tags = merge(
    local.common_tags,
    { "Name" = lower(
      format(
        "vpc-%s-%s-%s",
        var.project_tag,
        var.environment_tag,
        data.aws_region.current.name,
      ),
      )
    }
  )
}

## As of writing this terraform code, this resource function doesnt exist
# see https://github.com/terraform-providers/terraform-provider-aws/pull/1568 for more information
#resource "aws_vpc_secondary_ipv4_cidr_block" "secondary_cidr" {
#  vpc_id          = "${aws_vpc.pro.id}"
#  count           = "${length(var.secondary_cidr_block)}"
#  ipv4_cidr_block = "${element(var.secondary_cidr_block,count.index)}"
#}

resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.pro.id

  tags = merge(
    local.common_tags,
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
