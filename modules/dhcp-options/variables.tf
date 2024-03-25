variable "vpc_id" {
  type        = string
  description = "AWS VPC ID"
}

variable "environment_tag" {
  type        = string
  description = "Define the type of environment"
  default     = ""
}

variable "project_tag" {
  type        = string
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
