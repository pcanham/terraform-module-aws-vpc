variable "aws_region" {
  description = "AWS region to launch servers."
  default     = ""
}

variable "availability_zones" {
  type        = "list"
  description = "AWS region to launch servers."
  default     = ["eu-west-2a", "eu-west-2b"]
}

variable "master_cidr_block" {
  description = "VPC CIDR Block"
  default     = ""
}

variable "secondary_cidr_block" {
  description = "VPC CIDR Block"
  default     = []
}

variable "nat_gateway" {
  description = "Create NAT Gateway"
  default     = false
}

variable "public_cidr_blocks" {
  type        = "list"
  description = "CIDR Blocks for Public Subnets"
  default     = []
}

variable "private_cidr_blocks01" {
  type        = "list"
  description = "CIDR Blocks for Private Subnets"
  default     = []
}

variable "private_cidr_blocks02" {
  type        = "list"
  description = "CIDR Blocks for Private Subnets"
  default     = []
}

variable "private_cidr_blocks03" {
  type        = "list"
  description = "CIDR Blocks for Private Subnets"
  default     = []
}

variable "environment_tag" {
  description = "Define the type of environment"
  default     = ""
}

variable "project_tag" {
  description = "Project code name or name"
  default     = ""
}

variable "create_vpn" {
  description = "Create VPN"
  default     = false
}

variable "customergateway_name" {
  description = "Name of customer gateway"
  default     = ""
}

variable "customergateway_ip" {
  description = "IP Address of customer gateway"
  default     = ""
}

variable "vpn_cidr_block" {
  description = "CIDR Blocks to route via the VPN Connection"
  default     = []
}

variable "vpcflow_log_accepted_retention" {
  description = "How many days worth of VPC Flow logs to keep for accepted connections"
  default     = "14"
}

variable "vpcflow_log_rejected_retention" {
  description = "How many days worth of VPC Flow logs to keep for rejected connections"
  default     = "14"
}

variable "eks_clustername" {
  description = "EKS Cluster Name"
  default     = "eks-cluster"
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

variable "dhcp_domain_name" {
  description = "Enter a domain name (such as example.com)."
  default     = ""
}

variable "dhcp_domain_name_servers" {
  description = "Enter up to 4 DNS server IP addresses or AmazonProvidedDNS for AWS Defaults"
  default     = ["AmazonProvidedDNS"]
}

variable "dhcp_ntp_servers" {
  description = "Enter up to four Network Time Protocol (NTP) server IP addresses"
  default     = []
}

variable "dhcp_netbios_name_servers" {
  description = "Enter up to four NetBIOS name server IP addresses"
  default     = []
}

variable "dhcp_netbios_node_type" {
  description = "Enter the NetBIOS node type, for example, 2"
  default     = ""
}
