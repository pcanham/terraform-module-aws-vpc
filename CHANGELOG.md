<!-- markdownlint-disable -->

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---
<a name="unreleased"></a>
## [Unreleased]


<a name="v2.0.0"></a>
## [v2.0.0] - 2026-03-24
### Chores
- **deps:** update terraform aws to v6.35.1
- **deps:** update terraform aws to v6.34.0
- **deps:** update dependency automation/gitlabci-templates to v0.1.31
- **deps:** update terraform aws to v6.33.0
- **deps:** update terraform aws to v6.32.1
- **deps:** update terraform aws to v6.32.0
- **deps:** update terraform aws to v6.31.0
- **deps:** update dependency automation/gitlabci-templates to v0.1.30
- **deps:** update terraform aws to v6.30.0
- **deps:** update dependency automation/gitlabci-templates to v0.1.28
- **deps:** update dependency automation/gitlabci-templates to v0.1.26
- **deps:** update terraform aws to v6.28.0
- **deps:** update dependency automation/gitlabci-templates to v0.1.25
- **deps:** update dependency automation/gitlabci-templates to v0.1.23
- **deps:** update terraform aws to v6.27.0
- **deps:** update terraform aws to v6.26.0

### Code Refactoring
- **variables:** improve variable types and add CIDR validation

### Documentation
- fix README references to non-existent files
- significantly enhance README with comprehensive details
- regenerate documentation with terraform-docs
- add comprehensive migration guide for v2.0.0

### Features
- **vpc-endpoint:** add S3 endpoint policy support
- **vpc-flowlogs:** add KMS encryption support for CloudWatch logs


<a name="1.0.0"></a>
## [1.0.0] - 2025-12-14
### Chores
- **deps:** update dependency semantic-release to v25
- **deps:** update terraform aws to v6.23.0
- **deps:** update dependency automation/gitlabci-templates to v0.1.17
- **deps:** update dependency automation/gitlabci-templates to v0.1.21
- **deps:** update terraform aws to v6.18.0
- **deps:** update terraform aws to v6.22.1
- **deps:** update terraform aws to v6.22.0
- **deps:** update terraform aws to v6.21.0
- **deps:** update terraform aws to v6.20.0
- **deps:** update terraform aws to v6.19.0
- **deps:** update terraform aws to v6.24.0
- **deps:** update terraform aws to v6.25.0
- **deps:** update dependency automation/gitlabci-templates to v0.1.22
- **deps:** update terraform aws to v6.15.0
- **deps:** update dependency automation/gitlabci-templates to v0.1.20
- **deps:** update dependency automation/gitlabci-templates to v0.1.19
- **deps:** update dependency automation/gitlabci-templates to v0.1.18
- **deps:** update dependency [@commitlint](https://gitlab.localrealm.net/commitlint)/config-conventional to v20
- **deps:** update terraform aws to v6.14.1
- **deps:** update terraform aws to v6.14.0
- **release:** 1.0.0


<a name="0.1.38"></a>
## [0.1.38] - 2025-09-12
### Chores
- **deps:** update dependency automation/gitlabci-templates to v0.1.15
- **deps:** update terraform aws to v6.13.0
- **deps:** update dependency automation/gitlabci-templates to v0.1.14
- **deps:** update dependency automation/gitlabci-templates to v0.1.13
- **release:** 0.1.38

### Features
- marking more variables as not nullable
- README update
- adding in nullable options into variables.


<a name="0.1.37"></a>
## [0.1.37] - 2025-09-11
### Chores
- update README
- **deps:** update terraform aws to v6
- **deps:** update dependency automation/gitlabci-templates to v0.1.12
- **deps:** update dependency automation/gitlabci-templates to v0.1.11
- **deps:** update dependency automation/gitlabci-templates to v0.1.10
- **deps:** update dependency automation/gitlabci-templates to v0.1.9
- **release:** 0.1.37

### Features
- upgrade pre-commit


<a name="0.1.36"></a>
## [0.1.36] - 2025-06-22
### Bug Fixes
- add in missing vpv endpoint for subnet 04

### Chores
- **release:** 0.1.36


<a name="0.1.35"></a>
## [0.1.35] - 2025-06-22
### Bug Fixes
- update README

### Chores
- **release:** 0.1.35


<a name="0.1.34"></a>
## [0.1.34] - 2025-06-22
### Bug Fixes
- adding in missing varable for priv 04 subnet
- remove ref to project and environment variable

### Chores
- **release:** 0.1.34

### Features
- add custom tagging per private subnet and routing table
- add in another private subnet
- change tagging names making more generic


<a name="0.1.33"></a>
## [0.1.33] - 2025-06-20
### Bug Fixes
- support ipam

### Chores
- **release:** 0.1.33


<a name="0.1.32"></a>
## [0.1.32] - 2025-06-20
### Chores
- **release:** 0.1.32

### Features
- allow IPAM usage


<a name="0.1.31"></a>
## [0.1.31] - 2025-06-18
### Bug Fixes
- release part of pipeline fixed
- remove alpine version deps from pipeline
- bump pipeline version for image fixes
- bump pipeline version to fix alpine OS image upgrade

### Chores
- **deps:** update terraform aws to v5.100.0
- **deps:** update dependency automation/gitlabci-templates to v0.1.4
- **deps:** update terraform aws to v5.99.1
- **deps:** update terraform aws to v5.98.0
- **deps:** update terraform aws to v5.97.0
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.51
- **deps:** update terraform aws to v5.95.0
- **deps:** update terraform aws to v5.93.0
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.49
- **deps:** update terraform aws to v5.89.0
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.47
- **release:** 0.1.31

### Features
- move to central gitlab-ci template repo


<a name="0.1.30"></a>
## [0.1.30] - 2025-02-03
### Bug Fixes
- lint line ends fix
- stop parallel running of megalinter workarounf gh [#4591](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/issues/4591)
- ignore markdownlint 80 char line limit
- disable grype seeing issues with megalinter
- **chore:** lint fixes
- **chore:** lint fixes
- **lint:** prettier error for json format

### Chores
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.46
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.45
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.42
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.41
- **release:** 0.1.30

### Features
- standardising mega-linter config for tf modules


<a name="0.1.29"></a>
## [0.1.29] - 2025-01-25
### Bug Fixes
- markdown lint fixes

### Chores
- **deps:** update terraform aws to v5.75.0
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.39
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.31
- **deps:** update terraform aws to v5.84.0
- **deps:** update terraform aws to v5.82.2
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.38
- **deps:** update terraform aws to v5.80.0
- **deps:** update terraform aws to v5.78.0
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.37
- **deps:** update terraform aws to v5.77.0
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.36
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.35
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.34
- **deps:** update terraform aws to v5.75.1
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.22
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.40
- **deps:** update terraform aws to v5.73.0
- **deps:** update terraform aws to v5.72.1
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.30
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.29
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.28
- **deps:** update terraform aws to v5.67.0
- **deps:** update terraform aws to v5.63.0
- **deps:** update terraform aws to v5.61.0
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.25
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.24
- **deps:** update terraform aws to v5.59.0
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.23
- **deps:** update terraform aws to v5.58.0
- **release:** 0.1.29


<a name="0.1.28"></a>
## [0.1.28] - 2024-07-06
### Bug Fixes
- public tier name output

### Chores
- **deps:** update terraform aws to v5.57.0
- **release:** 0.1.28


<a name="0.1.27"></a>
## [0.1.27] - 2024-07-04
### Chores
- update readme
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.21
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.20
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.18
- **deps:** update terraform aws to v5.56.1
- **deps:** update terraform aws to v5.56.0
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.17
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.14
- **deps:** update terraform aws to v5.55.0
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.13
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.10


<a name="0.1.26"></a>
## [0.1.26] - 2024-06-14
### Bug Fixes
- remove flake8 tests
- [skip ci] allow longer commit message
- [skip ci] automerge incorrectly grouped not merged
- **lint:** flake8 errors
- **lint:** [skip ci] javascript fix using standard pre-commit

### Chores
- [skip ci] disable trivy working on getting pipelines working
- **deps:** update terraform aws to v5.54.0
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.8
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.7
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.6
- **deps:** update terraform aws to v5.54.1
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.4
- **deps:** update terraform aws to v5.53.0
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.3
- **deps:** update semantic-release monorepo
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.1
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.2.0
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.1.25
- **release:** 0.1.26

### Features
- enable auto-patching for minor and patches


<a name="0.1.25"></a>
## [0.1.25] - 2024-05-31
### Bug Fixes
- **lint:** around python script for auto generating diagrams

### Chores
- remove make file from repo changelog managed by pipeline
- **deps:** update terraform aws to v5.52.0
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.1.24
- **release:** 0.1.25


<a name="0.1.24"></a>
## [0.1.24] - 2024-05-27
### Bug Fixes
- module upgrade for fixes and ability to perform the upload of the module to registry
- fixing json syntax
- upgrading module
- upgrading AWS provider module ([#8](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/issues/8))
- cleaning up some typos in readme
- heading format
- removing incorrectly committed versions file
- missed entry where variable has been renamed to be more generic
- **ci:** adding in required configuration files

### Chores
- update pre-commit
- updating list types within variables
- update changelog
- updating versions file
- update pre-commit config moving to a standard for terraform modules
- setting up linters
- standardise renovatbot config
- [skip ci] set tagformat
- **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.89.1
- **deps:** update terraform aws to v5.46.0
- **deps:** update terraform aws to v5.47.0
- **deps:** update terraform aws to v5.48.0
- **deps:** update dependency automation/terraform/terraform-modules/gitlabci-tf-module-template to v0.1.23
- **deps:** update pre-commit hook pre-commit/pre-commit-hooks to v4.6.0
- **deps:** update pre-commit hook gitleaks/gitleaks to v8.18.2
- **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.89.0
- **deps:** update terraform aws to v5.49.0
- **deps:** update terraform aws to v5.51.1
- **deps:** update terraform aws to v5.45.0
- **deps:** update terraform aws to v5.44.0
- **deps:** update terraform aws to v5.43.0
- **deps:** update terraform aws to v5.50.0
- **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.90.0
- **deps:** update terraform aws to v5.51.0
- **deps:** update terraform aws to ~> 5.42.0
- **lint:** general lint fixes and readme updates
- **release:** 0.1.24

### Continuous Integrations
- adding in infracost to pre-commit for cost modelling
- pre-commit updating README

### Deprecated warning
- removing VPN creation from module

### Features
- setup gitlabci
- upgrading versions of pre-commit


<a name="0.1.12"></a>
## [0.1.12] - 2023-08-22

<a name="0.1.16"></a>
## [0.1.16] - 2023-08-22
### Bug Fixes
- removing incorrectly committed versions file
- fixed output of private_subnet03_ids
- remove duplicate variables around tags
- missed entry where variable has been renamed to be more generic
- missed entry where variable has been renamed to be more generic
- fixing incorrect type assignment
- Quoted type constraints are deprecated
- enabling s3 vpc endpoint
- removing tag variables.

### Chores
- updating list types within variables

### Code Refactoring
- re-naming k8s cluster name from eks to k8s
- removing unneeded datasource
- removing hard coded tags

### Continuous Integrations
- pre-commit updating README

### Deprecated warning
- removing VPN creation from module

### Features
- upgrading versions of pre-commit
- Adding tier tags to subnets
- parametrise DNS options within VPC
- making k8s tagging optional for subnets in vpc
- only create routes in private subnets going to nat gw's
- set default to 1 nat gw per az
- making s3 endpoint creation a parameter
- adding in dhcp options
- adding more tagging to aws items


<a name="0.1.6"></a>
## [0.1.6] - 2023-08-22

<a name="0.1.8"></a>
## [0.1.8] - 2023-08-22

<a name="0.1.23"></a>
## [0.1.23] - 2023-08-22

<a name="0.1.22"></a>
## [0.1.22] - 2023-08-22
### Bug Fixes
- upgrading AWS provider module ([#8](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/issues/8))
- cleaning up some typos in readme
- heading format
- removing incorrectly committed versions file
- fixed output of private_subnet03_ids
- remove duplicate variables around tags
- missed entry where variable has been renamed to be more generic
- missed entry where variable has been renamed to be more generic
- fixing incorrect type assignment
- Quoted type constraints are deprecated
- enabling s3 vpc endpoint
- removing tag variables.
- stop routing table creation when no cidr blocks listed
- Fixing issue that routing table keeps updating due to AWS API
- Seeing issues with names over 32 characters moving to name_prefix to fix the issue
- fixing output value should be id not result

### Chores
- update changelog
- updating list types within variables

### Code Refactoring
- re-naming k8s cluster name from eks to k8s
- removing unneeded datasource
- removing hard coded tags
- updating changelog config
- removing commented out code

### Continuous Integrations
- adding in infracost to pre-commit for cost modelling
- pre-commit updating README

### Deprecated warning
- removing VPN creation from module

### Features
- upgrading versions of pre-commit
- Adding tier tags to subnets
- parametrise DNS options within VPC
- making k8s tagging optional for subnets in vpc
- only create routes in private subnets going to nat gw's
- set default to 1 nat gw per az
- making s3 endpoint creation a parameter
- adding in dhcp options
- adding more tagging to aws items
- adding 3 private subnet for dedicated internal ALB subnet
- Adding AWS Region as an output
- making information more readable

### Reverts
- Merge branch 'release/v0.1.1' into develop

### Pull Requests
- Merge pull request [#1](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/issues/1) from pcanham/develop


<a name="0.1.2"></a>
## [0.1.2] - 2023-08-22

<a name="0.1.21"></a>
## [0.1.21] - 2023-08-22
### Bug Fixes
- cleaning up some typos in readme
- heading format

### Chores
- update changelog

### Continuous Integrations
- adding in infracost to pre-commit for cost modelling


<a name="0.1.18"></a>
## [0.1.18] - 2023-08-22
### Bug Fixes
- removing incorrectly committed versions file
- fixed output of private_subnet03_ids
- remove duplicate variables around tags
- missed entry where variable has been renamed to be more generic
- missed entry where variable has been renamed to be more generic
- fixing incorrect type assignment
- Quoted type constraints are deprecated
- enabling s3 vpc endpoint
- removing tag variables.
- stop routing table creation when no cidr blocks listed
- Fixing issue that routing table keeps updating due to AWS API
- Seeing issues with names over 32 characters moving to name_prefix to fix the issue
- fixing output value should be id not result

### Chores
- updating list types within variables

### Code Refactoring
- re-naming k8s cluster name from eks to k8s
- removing unneeded datasource
- removing hard coded tags
- updating changelog config
- removing commented out code

### Continuous Integrations
- pre-commit updating README

### Deprecated warning
- removing VPN creation from module

### Features
- upgrading versions of pre-commit
- Adding tier tags to subnets
- parametrise DNS options within VPC
- making k8s tagging optional for subnets in vpc
- only create routes in private subnets going to nat gw's
- set default to 1 nat gw per az
- making s3 endpoint creation a parameter
- adding in dhcp options
- adding more tagging to aws items
- adding 3 private subnet for dedicated internal ALB subnet
- Adding AWS Region as an output
- making information more readable

### Reverts
- Merge branch 'release/v0.1.1' into develop

### Pull Requests
- Merge pull request [#1](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/issues/1) from pcanham/develop


<a name="0.1.3"></a>
## [0.1.3] - 2023-08-22

<a name="0.1.13"></a>
## [0.1.13] - 2023-08-22
### Bug Fixes
- fixed output of private_subnet03_ids
- remove duplicate variables around tags

### Code Refactoring
- re-naming k8s cluster name from eks to k8s

### Features
- Adding tier tags to subnets
- parametrise DNS options within VPC
- making k8s tagging optional for subnets in vpc


<a name="0.1.9"></a>
## [0.1.9] - 2023-08-22
### Bug Fixes
- missed entry where variable has been renamed to be more generic
- fixing incorrect type assignment
- Quoted type constraints are deprecated
- enabling s3 vpc endpoint
- removing tag variables.
- stop routing table creation when no cidr blocks listed

### Code Refactoring
- removing unneeded datasource
- removing hard coded tags

### Features
- only create routes in private subnets going to nat gw's
- set default to 1 nat gw per az
- making s3 endpoint creation a parameter
- adding in dhcp options
- adding more tagging to aws items
- adding 3 private subnet for dedicated internal ALB subnet


<a name="0.1.5"></a>
## [0.1.5] - 2023-08-22

<a name="0.1.15"></a>
## [0.1.15] - 2023-08-22
### Bug Fixes
- removing incorrectly committed versions file
- fixed output of private_subnet03_ids

### Deprecated warning
- removing VPN creation from module

### Features
- Adding tier tags to subnets


<a name="0.1.10"></a>
## [0.1.10] - 2023-08-22

<a name="0.1.17"></a>
## [0.1.17] - 2023-08-22
### Bug Fixes
- removing incorrectly committed versions file
- fixed output of private_subnet03_ids
- remove duplicate variables around tags
- missed entry where variable has been renamed to be more generic
- missed entry where variable has been renamed to be more generic
- fixing incorrect type assignment
- Quoted type constraints are deprecated
- enabling s3 vpc endpoint
- removing tag variables.
- stop routing table creation when no cidr blocks listed
- Fixing issue that routing table keeps updating due to AWS API
- Seeing issues with names over 32 characters moving to name_prefix to fix the issue
- fixing output value should be id not result

### Chores
- updating list types within variables

### Code Refactoring
- re-naming k8s cluster name from eks to k8s
- removing unneeded datasource
- removing hard coded tags
- updating changelog config
- removing commented out code

### Continuous Integrations
- pre-commit updating README

### Deprecated warning
- removing VPN creation from module

### Features
- upgrading versions of pre-commit
- Adding tier tags to subnets
- parametrise DNS options within VPC
- making k8s tagging optional for subnets in vpc
- only create routes in private subnets going to nat gw's
- set default to 1 nat gw per az
- making s3 endpoint creation a parameter
- adding in dhcp options
- adding more tagging to aws items
- adding 3 private subnet for dedicated internal ALB subnet
- Adding AWS Region as an output
- making information more readable

### Reverts
- Merge branch 'release/v0.1.1' into develop

### Pull Requests
- Merge pull request [#1](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/issues/1) from pcanham/develop


<a name="0.1.4"></a>
## [0.1.4] - 2023-08-22

<a name="0.1.19"></a>
## [0.1.19] - 2023-08-22
### Bug Fixes
- removing incorrectly committed versions file
- fixed output of private_subnet03_ids
- remove duplicate variables around tags
- missed entry where variable has been renamed to be more generic
- missed entry where variable has been renamed to be more generic
- fixing incorrect type assignment
- Quoted type constraints are deprecated

### Chores
- update changelog
- updating list types within variables

### Code Refactoring
- re-naming k8s cluster name from eks to k8s

### Continuous Integrations
- pre-commit updating README

### Deprecated warning
- removing VPN creation from module

### Features
- upgrading versions of pre-commit
- Adding tier tags to subnets
- parametrise DNS options within VPC
- making k8s tagging optional for subnets in vpc
- only create routes in private subnets going to nat gw's
- set default to 1 nat gw per az


<a name="0.1.7"></a>
## [0.1.7] - 2023-08-22

<a name="0.1.14"></a>
## [0.1.14] - 2023-08-22

<a name="0.1.20"></a>
## [0.1.20] - 2023-08-22
### Bug Fixes
- cleaning up some typos in readme
- heading format
- removing incorrectly committed versions file
- missed entry where variable has been renamed to be more generic

### Chores
- update changelog
- updating list types within variables

### Continuous Integrations
- adding in infracost to pre-commit for cost modelling
- pre-commit updating README

### Deprecated warning
- removing VPN creation from module

### Features
- upgrading versions of pre-commit
- Adding tier tags to subnets


<a name="0.1.11"></a>
## [0.1.11] - 2023-08-22
### Bug Fixes
- fixed output of private_subnet03_ids
- remove duplicate variables around tags
- missed entry where variable has been renamed to be more generic
- fixing incorrect type assignment
- Quoted type constraints are deprecated
- enabling s3 vpc endpoint
- removing tag variables.
- stop routing table creation when no cidr blocks listed
- Fixing issue that routing table keeps updating due to AWS API
- Seeing issues with names over 32 characters moving to name_prefix to fix the issue
- fixing output value should be id not result

### Code Refactoring
- re-naming k8s cluster name from eks to k8s
- removing unneeded datasource
- removing hard coded tags
- updating changelog config
- removing commented out code

### Features
- parametrise DNS options within VPC
- making k8s tagging optional for subnets in vpc
- only create routes in private subnets going to nat gw's
- set default to 1 nat gw per az
- making s3 endpoint creation a parameter
- adding in dhcp options
- adding more tagging to aws items
- adding 3 private subnet for dedicated internal ALB subnet
- Adding AWS Region as an output
- making information more readable

### Reverts
- Merge branch 'release/v0.1.1' into develop

### Pull Requests
- Merge pull request [#1](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/issues/1) from pcanham/develop


<a name="0.1.1"></a>
## [0.1.1] - 2023-08-22

<a name="0.1.0"></a>
## 0.1.0 - 2023-08-22

[Unreleased]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/v2.0.0...HEAD
[v2.0.0]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/1.0.0...v2.0.0
[1.0.0]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.38...1.0.0
[0.1.38]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.37...0.1.38
[0.1.37]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.36...0.1.37
[0.1.36]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.35...0.1.36
[0.1.35]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.34...0.1.35
[0.1.34]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.33...0.1.34
[0.1.33]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.32...0.1.33
[0.1.32]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.31...0.1.32
[0.1.31]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.30...0.1.31
[0.1.30]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.29...0.1.30
[0.1.29]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.28...0.1.29
[0.1.28]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.27...0.1.28
[0.1.27]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.26...0.1.27
[0.1.26]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.25...0.1.26
[0.1.25]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.24...0.1.25
[0.1.24]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.12...0.1.24
[0.1.12]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.16...0.1.12
[0.1.16]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.6...0.1.16
[0.1.6]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.8...0.1.6
[0.1.8]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.23...0.1.8
[0.1.23]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.22...0.1.23
[0.1.22]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.2...0.1.22
[0.1.2]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.21...0.1.2
[0.1.21]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.18...0.1.21
[0.1.18]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.3...0.1.18
[0.1.3]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.13...0.1.3
[0.1.13]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.9...0.1.13
[0.1.9]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.5...0.1.9
[0.1.5]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.15...0.1.5
[0.1.15]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.10...0.1.15
[0.1.10]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.17...0.1.10
[0.1.17]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.4...0.1.17
[0.1.4]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.19...0.1.4
[0.1.19]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.7...0.1.19
[0.1.7]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.14...0.1.7
[0.1.14]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.20...0.1.14
[0.1.20]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.11...0.1.20
[0.1.11]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.1...0.1.11
[0.1.1]: https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.0...0.1.1
