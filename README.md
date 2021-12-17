## Util
Applications used within this repo to help with CHANGELOG creation and also checking files within the repo

- [git-chglog](https://github.com/git-chglog/git-chglog)
- [semtag](https://github.com/pnikosis/semtag)
- [pre-commit](https://pre-commit.com/)

Public Subnet - DMZ
Private Subnet 01 - Internal ALB Subnet
Private Subnet 02 - Application Subnet
Private Subnet 03 - Data Subnet

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| availability\_zones | AWS region to launch servers. | `list(any)` | <pre>[<br>  "eu-west-1a",<br>  "eu-west-1b"<br>]</pre> | no |
| aws\_region | AWS region to launch servers. | `string` | `"eu-west-1"` | no |
| dhcp\_domain\_name | Enter a domain name (such as example.com). | `string` | `""` | no |
| dhcp\_domain\_name\_servers | Enter up to 4 DNS server IP addresses or AmazonProvidedDNS for AWS Defaults | `list(any)` | <pre>[<br>  "AmazonProvidedDNS"<br>]</pre> | no |
| dhcp\_netbios\_name\_servers | Enter up to four NetBIOS name server IP addresses | `list(any)` | `[]` | no |
| dhcp\_netbios\_node\_type | Enter the NetBIOS node type, for example, 2 | `string` | `""` | no |
| dhcp\_ntp\_servers | Enter up to four Network Time Protocol (NTP) server IP addresses | `list(any)` | `[]` | no |
| enable\_vpc\_s3\_endpoint | Create VPC S3 Endpoint | `bool` | `false` | no |
| environment\_tag | Define the type of environment | `string` | `""` | no |
| k8s\_clustername | EKS/k8s Cluster Name | `string` | `null` | no |
| master\_cidr\_block | VPC CIDR Block | `string` | `""` | no |
| nat\_gateway | Create NAT Gateway | `bool` | `false` | no |
| one\_nat\_gateway\_per\_az | Should be true if you want one NAT Gateway per availability zone. | `bool` | `true` | no |
| private\_cidr\_blocks01 | CIDR Blocks for Private Subnets | `list(any)` | `[]` | no |
| private\_cidr\_blocks02 | CIDR Blocks for Private Subnets | `list(any)` | `[]` | no |
| private\_cidr\_blocks03 | CIDR Blocks for Private Subnets | `list(any)` | `[]` | no |
| project\_tag | Project code name or name | `string` | `""` | no |
| public\_cidr\_blocks | CIDR Blocks for Public Subnets | `list(any)` | `[]` | no |
| secondary\_cidr\_block | VPC CIDR Block | `list(any)` | `[]` | no |
| single\_nat\_gateway | Should be true if you want to provision for your entire VPC | `bool` | `false` | no |
| tags | A map of tags to add to all resources. | `map(string)` | `{}` | no |
| vpc\_enable\_dns\_hostnames | Enable VPC DNS Hostsnames | `bool` | `true` | no |
| vpc\_enable\_dns\_support | Enable VPC DNS Support | `bool` | `true` | no |
| vpcflow\_log\_accepted\_retention | How many days worth of VPC Flow logs to keep for accepted connections | `string` | `"14"` | no |
| vpcflow\_log\_rejected\_retention | How many days worth of VPC Flow logs to keep for rejected connections | `string` | `"14"` | no |

## Outputs

| Name | Description |
|------|-------------|
| all\_subnet\_ids | n/a |
| aws\_region | n/a |
| nat\_gw\_eips | n/a |
| private\_subnet01\_ids | n/a |
| private\_subnet02\_ids | n/a |
| private\_subnet03\_ids | n/a |
| private\_subnet\_ids | n/a |
| public\_subnet\_ids | n/a |
| vpc\_cidr | n/a |
| vpc\_id | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
