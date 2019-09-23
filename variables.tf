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

variable "owner_tag" {
  description = "Identifies the role that is responsible for the service"
  default     = ""
}

variable "project_tag" {
  description = "Project code name or name"
  default     = ""
}

variable "cost_center_tag" {
  description = "Budget code for responsible for the service"
  default     = ""
}

variable "business_tag" {
  description = "Business Stream that requires instance(s) e.g. Infrastructure, Legal, etc"
  default     = ""
}

variable "automation_tag" {
  description = "Tag to highlight services/components have been created with an automation tool"
  default     = "Created with Terraform"
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

