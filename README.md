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
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| availability\_zones | AWS region to launch servers. | list | `[ "eu-west-1a", "eu-west-1b" ]` | no |
| aws\_region | AWS region to launch servers. | string | `"eu-west-1"` | no |
| create\_vpn | Create VPN | bool | `"false"` | no |
| customergateway\_ip | IP Address of customer gateway | string | `""` | no |
| customergateway\_name | Name of customer gateway | string | `""` | no |
| dhcp\_domain\_name | Enter a domain name (such as example.com). | string | `""` | no |
| dhcp\_domain\_name\_servers | Enter up to 4 DNS server IP addresses or AmazonProvidedDNS for AWS Defaults | list | `[ "AmazonProvidedDNS" ]` | no |
| dhcp\_netbios\_name\_servers | Enter up to four NetBIOS name server IP addresses | list | `[]` | no |
| dhcp\_netbios\_node\_type | Enter the NetBIOS node type, for example, 2 | string | `""` | no |
| dhcp\_ntp\_servers | Enter up to four Network Time Protocol (NTP) server IP addresses | list | `[]` | no |
| eks\_clustername | EKS Cluster Name | string | `"eks-cluster"` | no |
| enable\_vpc\_s3\_endpoint | Create VPC S3 Endpoint | bool | `"false"` | no |
| environment\_tag | Define the type of environment | string | `""` | no |
| master\_cidr\_block | VPC CIDR Block | string | `""` | no |
| nat\_gateway | Create NAT Gateway | bool | `"false"` | no |
| one\_nat\_gateway\_per\_az | Should be true if you want one NAT Gateway per availability zone. | bool | `"true"` | no |
| private\_cidr\_blocks01 | CIDR Blocks for Private Subnets | list | `[]` | no |
| private\_cidr\_blocks02 | CIDR Blocks for Private Subnets | list | `[]` | no |
| private\_cidr\_blocks03 | CIDR Blocks for Private Subnets | list | `[]` | no |
| project\_tag | Project code name or name | string | `""` | no |
| public\_cidr\_blocks | CIDR Blocks for Public Subnets | list | `[]` | no |
| secondary\_cidr\_block | VPC CIDR Block | list | `[]` | no |
| single\_nat\_gateway | Should be true if you want to provision for your entire VPC | bool | `"false"` | no |
| tags | A map of tags to add to all resources. | map(string) | `{}` | no |
| vpcflow\_log\_accepted\_retention | How many days worth of VPC Flow logs to keep for accepted connections | string | `"14"` | no |
| vpcflow\_log\_rejected\_retention | How many days worth of VPC Flow logs to keep for rejected connections | string | `"14"` | no |
| vpn\_cidr\_block | CIDR Blocks to route via the VPN Connection | list | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| all\_subnet\_ids |  |
| aws\_region |  |
| nat\_gw\_eips |  |
| private\_subnet01\_ids |  |
| private\_subnet02\_ids |  |
| private\_subnet03\_ids |  |
| private\_subnet\_ids |  |
| public\_subnet\_ids |  |
| vpc\_cidr |  |
| vpc\_id |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
