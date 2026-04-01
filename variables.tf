variable "aws_region" {
  type        = string
  description = "AWS region to launch servers."
  default     = "eu-west-1"
  nullable    = false
}

variable "availability_zones" {
  type        = list(string)
  description = "AWS region to launch servers."
  default     = ["eu-west-1a", "eu-west-1b"]
  nullable    = false
}

variable "master_cidr_block" {
  type        = string
  description = "VPC CIDR Block"
  default     = ""
  nullable    = false

  validation {
    condition     = var.master_cidr_block == "" || can(cidrhost(var.master_cidr_block, 0))
    error_message = "The master_cidr_block must be a valid IPv4 CIDR block (e.g., 10.0.0.0/16)."
  }
}

variable "nat_gateway" {
  type        = bool
  description = "Create NAT Gateway"
  default     = false
}

variable "single_nat_gateway" {
  type        = bool
  description = "Should be true if you want to provision for your entire VPC"
  default     = false
}

variable "one_nat_gateway_per_az" {
  type        = bool
  description = "Should be true if you want one NAT Gateway per availability zone."
  default     = true
}

variable "ipv4_ipam_pool_id" {
  type        = string
  description = "Use IPv4 IPAM Pool for VPC"
  default     = ""
}

variable "ipv4_netmask_length" {
  description = "(Optional) The netmask length of the IPv4 CIDR you want to allocate to this VPC. Requires specifying a ipv4_ipam_pool_id"
  type        = number
  default     = null
  nullable    = true
}

variable "public_cidr_blocks" {
  type        = list(string)
  description = "CIDR Blocks for Public Subnets"
  default     = []

  validation {
    condition     = alltrue([for cidr in var.public_cidr_blocks : can(cidrhost(cidr, 0))])
    error_message = "All public_cidr_blocks must be valid IPv4 CIDR blocks."
  }
}

variable "private_cidr_blocks01" {
  type        = list(string)
  description = "CIDR Blocks for Private 01 Subnets"
  default     = []

  validation {
    condition     = alltrue([for cidr in var.private_cidr_blocks01 : can(cidrhost(cidr, 0))])
    error_message = "All private_cidr_blocks01 must be valid IPv4 CIDR blocks."
  }
}

variable "private_cidr_blocks02" {
  type        = list(string)
  description = "CIDR Blocks for Private 02 Subnets"
  default     = []

  validation {
    condition     = alltrue([for cidr in var.private_cidr_blocks02 : can(cidrhost(cidr, 0))])
    error_message = "All private_cidr_blocks02 must be valid IPv4 CIDR blocks."
  }
}

variable "private_cidr_blocks03" {
  type        = list(string)
  description = "CIDR Blocks for Private 03 Subnets"
  default     = []

  validation {
    condition     = alltrue([for cidr in var.private_cidr_blocks03 : can(cidrhost(cidr, 0))])
    error_message = "All private_cidr_blocks03 must be valid IPv4 CIDR blocks."
  }
}

variable "private_cidr_blocks04" {
  type        = list(string)
  description = "CIDR Blocks for Private 04 Subnets"
  default     = []

  validation {
    condition     = alltrue([for cidr in var.private_cidr_blocks04 : can(cidrhost(cidr, 0))])
    error_message = "All private_cidr_blocks04 must be valid IPv4 CIDR blocks."
  }
}

variable "name" {
  type        = string
  description = "VPC Name"
  default     = ""
}

variable "public_tier_name" {
  type        = string
  description = "Tag value for tier subnet"
  default     = "dmz"
  nullable    = false
}

variable "private01_tier_name" {
  type        = string
  description = "Tag value for tier subnet"
  default     = "lb"
  nullable    = false
}

variable "private02_tier_name" {
  type        = string
  description = "Tag value for tier subnet"
  default     = "web"
  nullable    = false
}

variable "private03_tier_name" {
  type        = string
  description = "Tag value for tier subnet"
  default     = "app"
  nullable    = false
}

variable "private04_tier_name" {
  type        = string
  description = "Tag value for tier subnet"
  default     = "data"
  nullable    = false
}

variable "vpcflow_log_accepted_retention" {
  type        = number
  description = "How many day's worth of VPC Flow logs to keep for accepted connections"
  default     = 14
  nullable    = false
}

variable "vpcflow_log_rejected_retention" {
  type        = number
  description = "How many day's worth of VPC Flow logs to keep for rejected connections"
  default     = 14
  nullable    = false
}

variable "k8s_clustername" {
  type        = string
  description = "EKS/k8s Cluster Name"
  default     = null
  nullable    = true
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources."
  default     = {}
}

variable "vpc_tags" {
  type        = map(string)
  description = "A map of tags to add to VPC resource."
  default     = {}
}

variable "private_subnet_tags" {
  type        = map(string)
  description = "A map of tags to assign to private subnets."
  default     = {}
}

variable "private01_subnet_tags" {
  type        = map(string)
  description = "A map of tags to assign to private subnet 01."
  default     = {}
}

variable "private02_subnet_tags" {
  type        = map(string)
  description = "A map of tags to assign to private subnet 02."
  default     = {}
}

variable "private03_subnet_tags" {
  type        = map(string)
  description = "A map of tags to assign to private subnet 03."
  default     = {}
}

variable "private04_subnet_tags" {
  type        = map(string)
  description = "A map of tags to assign to private subnet 04."
  default     = {}
}

variable "public_subnet_tags" {
  type        = map(string)
  description = "A map of tags to assign to public subnets."
  default     = {}
}

variable "private_routing_tables_tags" {
  type        = map(string)
  description = "A map of tags to assign to private routing tables."
  default     = {}
}

variable "private01_routing_tables_tags" {
  type        = map(string)
  description = "A map of tags to assign to private01 routing tables."
  default     = {}
}

variable "private02_routing_tables_tags" {
  type        = map(string)
  description = "A map of tags to assign to private02 routing tables."
  default     = {}
}

variable "private03_routing_tables_tags" {
  type        = map(string)
  description = "A map of tags to assign to private03 routing tables."
  default     = {}
}

variable "private04_routing_tables_tags" {
  type        = map(string)
  description = "A map of tags to assign to private04 routing tables."
  default     = {}
}

variable "public_routing_tables_tags" {
  type        = map(string)
  description = "A map of tags to assign to public routing tables."
  default     = {}
}

variable "dhcp_options_tags" {
  type        = map(string)
  description = "A map of tags to add to DHCP Options."
  default     = {}
}

variable "nat_gateway_tags" {
  type        = map(string)
  description = "A map of tags to add to NAT Gateway."
  default     = {}
}

variable "dhcp_domain_name" {
  type        = string
  description = "Enter a domain name (such as example.com)."
  default     = ""
}

variable "dhcp_domain_name_servers" {
  type        = list(string)
  description = "Enter up to 4 DNS server IP addresses or AmazonProvidedDNS for AWS Defaults"
  default     = ["AmazonProvidedDNS"]
}

variable "dhcp_ntp_servers" {
  type        = list(string)
  description = "Enter up to four Network Time Protocol (NTP) server IP addresses"
  default     = []
}

variable "dhcp_netbios_name_servers" {
  type        = list(string)
  description = "Enter up to four NetBIOS name server IP addresses"
  default     = []
}

variable "dhcp_netbios_node_type" {
  type        = string
  description = "Enter the NetBIOS node type, for example, 2"
  default     = ""
}

variable "enable_vpc_s3_endpoint" {
  type        = bool
  description = "Create VPC S3 Endpoint"
  default     = false
}

variable "vpc_s3_endpoint_policy" {
  type        = string
  description = "A policy to attach to the S3 endpoint that controls access. If not specified, full access is allowed."
  default     = null
  nullable    = true
}

variable "vpc_enable_dns_support" {
  type        = bool
  description = "Enable VPC DNS Support"
  default     = true
}

variable "vpc_enable_dns_hostnames" {
  type        = bool
  description = "Enable VPC DNS hostnames"
  default     = true
}

variable "vpcflow_log_kms_key_id" {
  type        = string
  description = "KMS key ID for encrypting VPC Flow Logs. If not specified, AWS managed encryption is used."
  default     = null
  nullable    = true
}

variable "enable_vpc_encryption_control" {
  type        = bool
  description = "Enable VPC encryption control (requires AWS provider >= 6.39.0)"
  default     = false
  nullable    = false
}

variable "vpc_encryption_control_mode" {
  type        = string
  description = "VPC encryption control mode: 'monitor' (default, logs violations) or 'enforce' (blocks unencrypted volumes)"
  default     = "monitor"
  nullable    = false

  validation {
    condition     = contains(["monitor", "enforce"], var.vpc_encryption_control_mode)
    error_message = "vpc_encryption_control_mode must be either 'monitor' or 'enforce'"
  }
}

variable "vpc_encryption_control_tags" {
  type        = map(string)
  description = "Additional tags for VPC encryption control resource"
  default     = {}
  nullable    = false
}

variable "vpc_encryption_exclude_internet_gateway" {
  type        = string
  description = "Exclude Internet Gateway from VPC encryption control: 'opt-in' or 'opt-out'"
  default     = null
  nullable    = true
}

variable "vpc_encryption_exclude_nat_gateway" {
  type        = string
  description = "Exclude NAT Gateway from VPC encryption control: 'opt-in' or 'opt-out'"
  default     = null
  nullable    = true
}

variable "vpc_encryption_exclude_egress_only_internet_gateway" {
  type        = string
  description = "Exclude Egress-only Internet Gateway from VPC encryption control: 'opt-in' or 'opt-out'"
  default     = null
  nullable    = true
}

variable "vpc_encryption_exclude_virtual_private_gateway" {
  type        = string
  description = "Exclude Virtual Private Gateway from VPC encryption control: 'opt-in' or 'opt-out'"
  default     = null
  nullable    = true
}

variable "vpc_encryption_exclude_vpc_peering" {
  type        = string
  description = "Exclude VPC Peering connections from VPC encryption control: 'opt-in' or 'opt-out'"
  default     = null
  nullable    = true
}

variable "vpc_encryption_exclude_vpc_lattice" {
  type        = string
  description = "Exclude VPC Lattice from VPC encryption control: 'opt-in' or 'opt-out'"
  default     = null
  nullable    = true
}

variable "vpc_encryption_exclude_lambda" {
  type        = string
  description = "Exclude Lambda functions from VPC encryption control: 'opt-in' or 'opt-out'"
  default     = null
  nullable    = true
}

variable "vpc_encryption_exclude_elastic_file_system" {
  type        = string
  description = "Exclude Elastic File System from VPC encryption control: 'opt-in' or 'opt-out'"
  default     = null
  nullable    = true
}
