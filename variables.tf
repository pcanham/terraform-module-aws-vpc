variable "aws_region" {
  type        = string
  description = "AWS region to launch servers."
  default     = "eu-west-1"
}

variable "availability_zones" {
  type        = list(any)
  description = "AWS region to launch servers."
  default     = ["eu-west-1a", "eu-west-1b"]
}

variable "master_cidr_block" {
  type        = string
  description = "VPC CIDR Block"
  default     = ""
}

variable "secondary_cidr_block" {
  type        = list(any)
  description = "VPC CIDR Block"
  default     = []
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

variable "public_cidr_blocks" {
  type        = list(any)
  description = "CIDR Blocks for Public Subnets"
  default     = []
}

variable "private_cidr_blocks01" {
  type        = list(any)
  description = "CIDR Blocks for Private Subnets"
  default     = []
}

variable "private_cidr_blocks02" {
  type        = list(any)
  description = "CIDR Blocks for Private Subnets"
  default     = []
}

variable "private_cidr_blocks03" {
  type        = list(any)
  description = "CIDR Blocks for Private Subnets"
  default     = []
}

variable "vpcflow_log_accepted_retention" {
  type        = string
  description = "How many days worth of VPC Flow logs to keep for accepted connections"
  default     = "14"
}

variable "vpcflow_log_rejected_retention" {
  type        = string
  description = "How many days worth of VPC Flow logs to keep for rejected connections"
  default     = "14"
}

variable "k8s_clustername" {
  type        = string
  description = "EKS/k8s Cluster Name"
  default     = null
}

variable "environment_tag" {
  description = "Define the type of environment"
  default     = ""
}

variable "project_tag" {
  description = "Project code name or name"
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources."
  default     = {}
}

variable "dhcp_domain_name" {
  type        = string
  description = "Enter a domain name (such as example.com)."
  default     = ""
}

variable "dhcp_domain_name_servers" {
  type        = list(any)
  description = "Enter up to 4 DNS server IP addresses or AmazonProvidedDNS for AWS Defaults"
  default     = ["AmazonProvidedDNS"]
}

variable "dhcp_ntp_servers" {
  type        = list(any)
  description = "Enter up to four Network Time Protocol (NTP) server IP addresses"
  default     = []
}

variable "dhcp_netbios_name_servers" {
  type        = list(any)
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

variable "vpc_enable_dns_support" {
  type        = bool
  description = "Enable VPC DNS Support"
  default     = true
}

variable "vpc_enable_dns_hostnames" {
  type        = bool
  description = "Enable VPC DNS Hostsnames"
  default     = true
}
