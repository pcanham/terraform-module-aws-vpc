# VPC Encryption Control
# Controls EBS volume encryption requirements for resources launched in the VPC
# Requires AWS provider >= 6.39.0
#
# Mode options:
# - "monitor": Logs when unencrypted volumes are created
# - "enforce": Blocks creation of unencrypted EBS volumes
#
# Exclusions allow specific VPC-attached AWS services to bypass encryption control

resource "aws_vpc_encryption_control" "this" {
  count = var.enable_vpc_encryption_control ? 1 : 0

  vpc_id = aws_vpc.main.id
  mode   = var.vpc_encryption_control_mode

  # Service-specific exclusions (opt-in/opt-out)
  internet_gateway_exclusion             = var.vpc_encryption_exclude_internet_gateway
  nat_gateway_exclusion                  = var.vpc_encryption_exclude_nat_gateway
  egress_only_internet_gateway_exclusion = var.vpc_encryption_exclude_egress_only_internet_gateway
  virtual_private_gateway_exclusion      = var.vpc_encryption_exclude_virtual_private_gateway
  vpc_peering_exclusion                  = var.vpc_encryption_exclude_vpc_peering
  vpc_lattice_exclusion                  = var.vpc_encryption_exclude_vpc_lattice
  lambda_exclusion                       = var.vpc_encryption_exclude_lambda
  elastic_file_system_exclusion          = var.vpc_encryption_exclude_elastic_file_system

  tags = merge(
    var.tags,
    var.vpc_encryption_control_tags,
    {
      Name = "vpc-encryption-control-${var.name}"
    }
  )
}
