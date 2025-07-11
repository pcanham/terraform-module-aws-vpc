# AWS VPC terraform module

## Overview

This is an opinionated terraform module for provisioning a VPC on AWS for my use case. Before you try it out yourself, please remember it...

- has been designed for my usage
- might not work for other people
- please raise pull requests or issues around the module, but I cannot guarantee when or if I will be able to incorporate them

Here is a visual presentation of what it looks like

![AWS VPC Diagram](diagrams/vpc_diagram.png)

## Util

Applications used within this repo to help with CHANGELOG creation and also checking files within the repo

- [git-chglog](https://github.com/git-chglog/git-chglog)
- [semtag](https://github.com/pnikosis/semtag)
- [pre-commit](https://pre-commit.com/)
- [gitleaks](https://gitleaks.io/)

## Subnet Layout

This Module can deploy a 4-tier VPC layout, if you do not wish to have the 4th tier, do not add in the CIDR ranges to private_cidr_blocks03

- Public Subnet - DMZ
- Private Subnet 01 - Web Subnet
- Private Subnet 02 - Application Subnet
- Private Subnet 03 - Data Subnet

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.100.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.100.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.LogGroup-Accept](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.LogGroup-Reject](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_default_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/default_security_group) | resource |
| [aws_eip.nat_ip](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/eip) | resource |
| [aws_flow_log.VpcFlowLog-Accept](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/flow_log) | resource |
| [aws_flow_log.VpcFlowLog-Reject](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/flow_log) | resource |
| [aws_iam_policy.vpc_flow_log_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/iam_policy) | resource |
| [aws_iam_role.vpc_flow_log_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.vpc_flow_log_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_internet_gateway.internet_gw](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.nat_gw](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/nat_gateway) | resource |
| [aws_route.private01_ngw](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/route) | resource |
| [aws_route.private02_ngw](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/route) | resource |
| [aws_route.private03_ngw](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/route) | resource |
| [aws_route.private04_ngw](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/route) | resource |
| [aws_route_table.private01](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/route_table) | resource |
| [aws_route_table.private02](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/route_table) | resource |
| [aws_route_table.private03](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/route_table) | resource |
| [aws_route_table.private04](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private01](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private02](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private03](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private04](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/route_table_association) | resource |
| [aws_subnet.pm_pro_private01](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/subnet) | resource |
| [aws_subnet.pm_pro_private02](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/subnet) | resource |
| [aws_subnet.pm_pro_private03](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/subnet) | resource |
| [aws_subnet.pm_pro_private04](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/subnet) | resource |
| [aws_subnet.pm_pro_public](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/subnet) | resource |
| [aws_vpc.pro](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/vpc) | resource |
| [aws_vpc_dhcp_options.dhcp_options](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/vpc_dhcp_options) | resource |
| [aws_vpc_dhcp_options_association.dhcp_options](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/vpc_dhcp_options_association) | resource |
| [aws_vpc_endpoint.s3](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint_route_table_association.private01_s3](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/vpc_endpoint_route_table_association) | resource |
| [aws_vpc_endpoint_route_table_association.private02_s3](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/vpc_endpoint_route_table_association) | resource |
| [aws_vpc_endpoint_route_table_association.private03_s3](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/vpc_endpoint_route_table_association) | resource |
| [aws_vpc_endpoint_route_table_association.private04_s3](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/vpc_endpoint_route_table_association) | resource |
| [aws_vpc_endpoint_route_table_association.public_s3](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/resources/vpc_endpoint_route_table_association) | resource |
| [aws_iam_policy_document.vpc_flow_log_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.vpc_flow_logs_assume_role](https://registry.terraform.io/providers/hashicorp/aws/5.100.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | AWS region to launch servers. | `list(any)` | <pre>[<br>  "eu-west-1a",<br>  "eu-west-1b"<br>]</pre> | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region to launch servers. | `string` | `"eu-west-1"` | no |
| <a name="input_dhcp_domain_name"></a> [dhcp\_domain\_name](#input\_dhcp\_domain\_name) | Enter a domain name (such as example.com). | `string` | `""` | no |
| <a name="input_dhcp_domain_name_servers"></a> [dhcp\_domain\_name\_servers](#input\_dhcp\_domain\_name\_servers) | Enter up to 4 DNS server IP addresses or AmazonProvidedDNS for AWS Defaults | `list(any)` | <pre>[<br>  "AmazonProvidedDNS"<br>]</pre> | no |
| <a name="input_dhcp_netbios_name_servers"></a> [dhcp\_netbios\_name\_servers](#input\_dhcp\_netbios\_name\_servers) | Enter up to four NetBIOS name server IP addresses | `list(any)` | `[]` | no |
| <a name="input_dhcp_netbios_node_type"></a> [dhcp\_netbios\_node\_type](#input\_dhcp\_netbios\_node\_type) | Enter the NetBIOS node type, for example, 2 | `string` | `""` | no |
| <a name="input_dhcp_ntp_servers"></a> [dhcp\_ntp\_servers](#input\_dhcp\_ntp\_servers) | Enter up to four Network Time Protocol (NTP) server IP addresses | `list(any)` | `[]` | no |
| <a name="input_dhcp_options_tags"></a> [dhcp\_options\_tags](#input\_dhcp\_options\_tags) | A map of tags to add to DHCP Options. | `map(string)` | `{}` | no |
| <a name="input_enable_vpc_s3_endpoint"></a> [enable\_vpc\_s3\_endpoint](#input\_enable\_vpc\_s3\_endpoint) | Create VPC S3 Endpoint | `bool` | `false` | no |
| <a name="input_ipv4_ipam_pool_id"></a> [ipv4\_ipam\_pool\_id](#input\_ipv4\_ipam\_pool\_id) | Use IPv4 IPAM Pool for VPC | `string` | `""` | no |
| <a name="input_ipv4_netmask_length"></a> [ipv4\_netmask\_length](#input\_ipv4\_netmask\_length) | (Optional) The netmask length of the IPv4 CIDR you want to allocate to this VPC. Requires specifying a ipv4\_ipam\_pool\_id | `number` | `null` | no |
| <a name="input_k8s_clustername"></a> [k8s\_clustername](#input\_k8s\_clustername) | EKS/k8s Cluster Name | `string` | `null` | no |
| <a name="input_master_cidr_block"></a> [master\_cidr\_block](#input\_master\_cidr\_block) | VPC CIDR Block | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | VPC Name | `string` | `""` | no |
| <a name="input_nat_gateway"></a> [nat\_gateway](#input\_nat\_gateway) | Create NAT Gateway | `bool` | `false` | no |
| <a name="input_nat_gateway_tags"></a> [nat\_gateway\_tags](#input\_nat\_gateway\_tags) | A map of tags to add to NAT Gateway. | `map(string)` | `{}` | no |
| <a name="input_one_nat_gateway_per_az"></a> [one\_nat\_gateway\_per\_az](#input\_one\_nat\_gateway\_per\_az) | Should be true if you want one NAT Gateway per availability zone. | `bool` | `true` | no |
| <a name="input_private01_routing_tables_tags"></a> [private01\_routing\_tables\_tags](#input\_private01\_routing\_tables\_tags) | A map of tags to assign to private01 routing tables. | `map(string)` | `{}` | no |
| <a name="input_private01_subnet_tags"></a> [private01\_subnet\_tags](#input\_private01\_subnet\_tags) | A map of tags to assign to private subnet 01. | `map(string)` | `{}` | no |
| <a name="input_private01_tier_name"></a> [private01\_tier\_name](#input\_private01\_tier\_name) | Tag value for tier subnet | `string` | `"lb"` | no |
| <a name="input_private02_routing_tables_tags"></a> [private02\_routing\_tables\_tags](#input\_private02\_routing\_tables\_tags) | A map of tags to assign to private02 routing tables. | `map(string)` | `{}` | no |
| <a name="input_private02_subnet_tags"></a> [private02\_subnet\_tags](#input\_private02\_subnet\_tags) | A map of tags to assign to private subnet 02. | `map(string)` | `{}` | no |
| <a name="input_private02_tier_name"></a> [private02\_tier\_name](#input\_private02\_tier\_name) | Tag value for tier subnet | `string` | `"web"` | no |
| <a name="input_private03_routing_tables_tags"></a> [private03\_routing\_tables\_tags](#input\_private03\_routing\_tables\_tags) | A map of tags to assign to private03 routing tables. | `map(string)` | `{}` | no |
| <a name="input_private03_subnet_tags"></a> [private03\_subnet\_tags](#input\_private03\_subnet\_tags) | A map of tags to assign to private subnet 03. | `map(string)` | `{}` | no |
| <a name="input_private03_tier_name"></a> [private03\_tier\_name](#input\_private03\_tier\_name) | Tag value for tier subnet | `string` | `"app"` | no |
| <a name="input_private04_routing_tables_tags"></a> [private04\_routing\_tables\_tags](#input\_private04\_routing\_tables\_tags) | A map of tags to assign to private04 routing tables. | `map(string)` | `{}` | no |
| <a name="input_private04_subnet_tags"></a> [private04\_subnet\_tags](#input\_private04\_subnet\_tags) | A map of tags to assign to private subnet 04. | `map(string)` | `{}` | no |
| <a name="input_private04_tier_name"></a> [private04\_tier\_name](#input\_private04\_tier\_name) | Tag value for tier subnet | `string` | `"data"` | no |
| <a name="input_private_cidr_blocks01"></a> [private\_cidr\_blocks01](#input\_private\_cidr\_blocks01) | CIDR Blocks for Private 01 Subnets | `list(any)` | `[]` | no |
| <a name="input_private_cidr_blocks02"></a> [private\_cidr\_blocks02](#input\_private\_cidr\_blocks02) | CIDR Blocks for Private 02 Subnets | `list(any)` | `[]` | no |
| <a name="input_private_cidr_blocks03"></a> [private\_cidr\_blocks03](#input\_private\_cidr\_blocks03) | CIDR Blocks for Private 03 Subnets | `list(any)` | `[]` | no |
| <a name="input_private_cidr_blocks04"></a> [private\_cidr\_blocks04](#input\_private\_cidr\_blocks04) | CIDR Blocks for Private 04 Subnets | `list(any)` | `[]` | no |
| <a name="input_private_routing_tables_tags"></a> [private\_routing\_tables\_tags](#input\_private\_routing\_tables\_tags) | A map of tags to assign to private routing tables. | `map(string)` | `{}` | no |
| <a name="input_private_subnet_tags"></a> [private\_subnet\_tags](#input\_private\_subnet\_tags) | A map of tags to assign to private subnets. | `map(string)` | `{}` | no |
| <a name="input_public_cidr_blocks"></a> [public\_cidr\_blocks](#input\_public\_cidr\_blocks) | CIDR Blocks for Public Subnets | `list(any)` | `[]` | no |
| <a name="input_public_routing_tables_tags"></a> [public\_routing\_tables\_tags](#input\_public\_routing\_tables\_tags) | A map of tags to assign to public routing tables. | `map(string)` | `{}` | no |
| <a name="input_public_subnet_tags"></a> [public\_subnet\_tags](#input\_public\_subnet\_tags) | A map of tags to assign to public subnets. | `map(string)` | `{}` | no |
| <a name="input_public_tier_name"></a> [public\_tier\_name](#input\_public\_tier\_name) | Tag value for tier subnet | `string` | `"dmz"` | no |
| <a name="input_single_nat_gateway"></a> [single\_nat\_gateway](#input\_single\_nat\_gateway) | Should be true if you want to provision for your entire VPC | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |
| <a name="input_vpc_enable_dns_hostnames"></a> [vpc\_enable\_dns\_hostnames](#input\_vpc\_enable\_dns\_hostnames) | Enable VPC DNS hostnames | `bool` | `true` | no |
| <a name="input_vpc_enable_dns_support"></a> [vpc\_enable\_dns\_support](#input\_vpc\_enable\_dns\_support) | Enable VPC DNS Support | `bool` | `true` | no |
| <a name="input_vpc_tags"></a> [vpc\_tags](#input\_vpc\_tags) | A map of tags to add to VPC resource. | `map(string)` | `{}` | no |
| <a name="input_vpcflow_log_accepted_retention"></a> [vpcflow\_log\_accepted\_retention](#input\_vpcflow\_log\_accepted\_retention) | How many day's worth of VPC Flow logs to keep for accepted connections | `string` | `"14"` | no |
| <a name="input_vpcflow_log_rejected_retention"></a> [vpcflow\_log\_rejected\_retention](#input\_vpcflow\_log\_rejected\_retention) | How many day's worth of VPC Flow logs to keep for rejected connections | `string` | `"14"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_all_subnet_ids"></a> [all\_subnet\_ids](#output\_all\_subnet\_ids) | List all used subnet ids |
| <a name="output_aws_region"></a> [aws\_region](#output\_aws\_region) | AWS Region being used |
| <a name="output_nat_gw_eips"></a> [nat\_gw\_eips](#output\_nat\_gw\_eips) | List all NAT Gateway Public IPs |
| <a name="output_private01_routing_table_ids"></a> [private01\_routing\_table\_ids](#output\_private01\_routing\_table\_ids) | Routing table ids for private 01 subnets |
| <a name="output_private01_tier_name"></a> [private01\_tier\_name](#output\_private01\_tier\_name) | Tag being used for describing private subnet 01 tier |
| <a name="output_private02_routing_table_ids"></a> [private02\_routing\_table\_ids](#output\_private02\_routing\_table\_ids) | Routing table ids for private 02 subnets |
| <a name="output_private02_tier_name"></a> [private02\_tier\_name](#output\_private02\_tier\_name) | Tag being used for describing private subnet 02 tier |
| <a name="output_private03_routing_table_ids"></a> [private03\_routing\_table\_ids](#output\_private03\_routing\_table\_ids) | Routing table ids for private 03 subnets |
| <a name="output_private03_tier_name"></a> [private03\_tier\_name](#output\_private03\_tier\_name) | Tag being used for describing private subnet 03 tier |
| <a name="output_private04_routing_table_ids"></a> [private04\_routing\_table\_ids](#output\_private04\_routing\_table\_ids) | Routing table ids for private 04 subnets |
| <a name="output_private04_tier_name"></a> [private04\_tier\_name](#output\_private04\_tier\_name) | Tag being used for describing private subnet 04 tier |
| <a name="output_private_subnet01_ids"></a> [private\_subnet01\_ids](#output\_private\_subnet01\_ids) | List all used private 01 subnet ids |
| <a name="output_private_subnet02_ids"></a> [private\_subnet02\_ids](#output\_private\_subnet02\_ids) | List all used private 02 subnet ids |
| <a name="output_private_subnet03_ids"></a> [private\_subnet03\_ids](#output\_private\_subnet03\_ids) | List all used private 03 subnet ids |
| <a name="output_private_subnet04_ids"></a> [private\_subnet04\_ids](#output\_private\_subnet04\_ids) | List all used private 04 subnet ids |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | List all used private subnet ids |
| <a name="output_public_routing_table_ids"></a> [public\_routing\_table\_ids](#output\_public\_routing\_table\_ids) | Routing table ids for public subnets |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | List all used public subnet ids |
| <a name="output_public_tier_name"></a> [public\_tier\_name](#output\_public\_tier\_name) | Tag being used for describing public subnet tier |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | CIDR Range being used by VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | AWS VPC ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
