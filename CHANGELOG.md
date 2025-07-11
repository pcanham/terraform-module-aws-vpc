## [0.1.36](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.35...0.1.36) (2025-06-22)


### Bug Fixes

* add in missing vpv endpoint for subnet 04 ([b488b7d](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/b488b7d9ee50e4915add3129f73d8755804e11e7))

## [0.1.35](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.34...0.1.35) (2025-06-22)


### Bug Fixes

* update README ([fd334c2](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/fd334c281909540094607825e55f1cb21a777cb9))

## [0.1.34](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.33...0.1.34) (2025-06-22)


### Bug Fixes

* adding in missing varable for priv 04 subnet ([e8f972d](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/e8f972d1089c891ff6e2ca0f35cb9b3edc1b3596))
* remove ref to project and environment variable ([ba06f1a](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/ba06f1a483ca55fccaf0e770411a1aacdbf788fd))


### Features

* add custom tagging per private subnet and routing table ([93bc6e6](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/93bc6e68019259223c9861e77c8f1af2c35fb283))
* add in another private subnet ([73084bb](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/73084bb0f52196d9166c03ccd691e816fda1168b))
* change tagging names making more generic ([b615abe](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/b615abe160797d2703f08a61d06076c6ef893fe7))

## [0.1.33](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.32...0.1.33) (2025-06-20)


### Bug Fixes

* support ipam ([e6e6694](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/e6e6694ed364b0bebc6fc9dc6b5a9003726f826a))

## [0.1.32](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.31...0.1.32) (2025-06-20)


### Features

* allow IPAM usage ([379f35a](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/379f35a7694b8a88f443822fb49b228a7845970a))

## [0.1.31](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.30...0.1.31) (2025-06-18)


### Bug Fixes

* bump pipeline version for image fixes ([6f6488f](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/6f6488fb4eab3c5c0e2ff0f1e9bd67cf60f740f2))
* bump pipeline version to fix alpine OS image upgrade ([a5931be](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/a5931be20961ee742e6d60ebb0dba00f4820f18f))
* release part of pipeline fixed ([3d77588](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/3d77588fcfb24d39332fb56e44efd705bb691831))
* remove alpine version deps from pipeline ([066a519](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/066a5192e150851ca807c4e1d0ee8457aaecfc24))


### Features

* move to central gitlab-ci template repo ([5e6a292](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/5e6a29242a3e5c4cdca54316240485e13a00a6be))

## [0.1.30](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.29...0.1.30) (2025-02-03)


### Bug Fixes

* disable grype seeing issues with megalinter ([6a7f672](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/6a7f672bac500d95ad24d45db92fcd2c61bd60d6))
* ignore markdownlint 80 char line limit ([526878d](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/526878dfe84011a9796956e36b0c4130b073cf93))
* **chore:** lint fixes ([6ff62bc](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/6ff62bc618597c4eff83e5322e1e24ec172621d5))
* **chore:** lint fixes ([5cce7fd](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/5cce7fd42095ef6010d14b480294ac4de676491a))
* lint line ends fix ([6f40a7a](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/6f40a7a87f520bf5fccf3d036b4047d4c189d0d7))
* **lint:** prettier error for json format ([ccfb082](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/ccfb082fd3c5bb0ce1cd024666a5d5dbc3ad6759))
* stop parallel running of megalinter workarounf gh [#4591](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/issues/4591) ([a10fe3b](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/a10fe3b728d64f4c65231afdd117d4b92caca312))


### Features

* standardising mega-linter config for tf modules ([490c067](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/490c0675f09faab63284b72f82251293a2c0d46b))

## [0.1.29](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.28...0.1.29) (2025-01-25)


### Bug Fixes

* markdown lint fixes ([451983e](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/451983e2f40bd8a9ea2c38d0df89d8315c70156e))

## [0.1.28](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.27...0.1.28) (2024-07-06)


### Bug Fixes

* public tier name output ([2ce4ba1](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/2ce4ba16c73826c90ce8d39a918022ef3267204a))

## [0.1.26](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.25...0.1.26) (2024-06-14)


### Bug Fixes

* [skip ci] allow longer commit message ([c738a67](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/c738a67398798d8da97828b5e96f49a180ae9aa4))
* [skip ci] automerge incorrectly grouped not merged ([4787a82](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/4787a828de79bf6136fa55e0a534b55138a868d0))
* **lint:** [skip ci] javascript fix using standard pre-commit ([e30cd1d](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/e30cd1d243e6129793c8311829c8307dfd5357c7))
* **lint:** flake8 errors ([369a830](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/369a830b7384dd561c0d6cb6b2724aeab323e2ec))
* remove flake8 tests ([e58d942](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/e58d942d590c890894868022ab40f8fe60a52327))


### Features

* enable auto-patching for minor and patches ([f803ddb](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/f803ddb9e1fc01a48d84600b700372aa4f7a2a75))

## [0.1.25](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.24...0.1.25) (2024-05-31)


### Bug Fixes

* **lint:** around python script for auto generating diagrams ([3f1c8df](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/3f1c8df15444b868ee314ae923634ba2e42b2533))

## [0.1.24](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/compare/0.1.23...0.1.24) (2024-05-27)


### Bug Fixes

* **ci:** adding in required configuration files ([a33e2a1](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/a33e2a18b249b49e8aefa1cf15ad38de74bc6e86))
* fixing json syntax ([c848f7d](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/c848f7de42eee478584049b95bb779139fc9bbb7))
* module upgrade for fixes and ability to perform the upload of the module to registry ([bd3152a](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/bd3152a7cf6af61a04b1410c1be60e5716c30e57))
* upgrading module ([2b338db](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/2b338db8cec4265d47f8d7390ea1b5e5da129516))


### Features

* setup gitlabci ([f078550](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-vpc/commit/f0785506a31d242607ffb8fe46bf68ac4503b086))

# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---
<a name="unreleased"></a>
## [Unreleased]


<a name="v0.1.21"></a>
## [v0.1.21] - 2022-11-24

<a name="v0.1.20"></a>
## [v0.1.20] - 2022-11-24
### Bug Fixes
- cleaning up some typos in readme
- heading format

### Continuous Integrations
- adding in infracost to pre-commit for cost modelling


<a name="v0.1.19"></a>
## [v0.1.19] - 2022-11-17
### Chores
- update changelog


<a name="v0.1.18"></a>
## [v0.1.18] - 2021-12-17

<a name="v0.1.17"></a>
## [v0.1.17] - 2021-12-17

<a name="v0.1.16"></a>
## [v0.1.16] - 2021-12-17
### Bug Fixes
- missed entry where variable has been renamed to be more generic

### Chores
- updating list types within variables

### Continuous Integrations
- pre-commit updating README

### Features
- upgrading versions of pre-commit


<a name="v0.1.15"></a>
## [v0.1.15] - 2020-08-07
### Bug Fixes
- removing incorrectly committed versions file


<a name="v0.1.14"></a>
## [v0.1.14] - 2020-08-07
### Deprecated warning
- removing VPN creation from module


<a name="v0.1.13"></a>
## [v0.1.13] - 2020-07-13

<a name="v0.1.12"></a>
## [v0.1.12] - 2020-05-15
### Features
- Adding tier tags to subnets


<a name="v0.1.11"></a>
## [v0.1.11] - 2020-05-06
### Bug Fixes
- fixed output of private_subnet03_ids


<a name="v0.1.10"></a>
## [v0.1.10] - 2020-01-09
### Bug Fixes
- remove duplicate variables around tags

### Code Refactoring
- re-naming k8s cluster name from eks to k8s

### Features
- parametrise DNS options within VPC
- making k8s tagging optional for subnets in vpc


<a name="v0.1.9"></a>
## [v0.1.9] - 2020-01-08
### Bug Fixes
- missed entry where variable has been renamed to be more generic
- fixing incorrect type assignment


<a name="v0.1.8"></a>
## [v0.1.8] - 2019-11-25
### Bug Fixes
- Quoted type constraints are deprecated

### Features
- only create routes in private subnets going to nat gw's
- set default to 1 nat gw per az


<a name="v0.1.7"></a>
## [v0.1.7] - 2019-09-23
### Bug Fixes
- enabling s3 vpc endpoint
- removing tag variables.

### Code Refactoring
- removing unneeded datasource
- removing hard coded tags

### Features
- making s3 endpoint creation a parameter
- adding in dhcp options
- adding more tagging to aws items


<a name="v0.1.6"></a>
## [v0.1.6] - 2019-09-20
### Bug Fixes
- stop routing table creation when no cidr blocks listed

### Features
- adding 3 private subnet for dedicated internal ALB subnet


<a name="v0.1.5"></a>
## [v0.1.5] - 2019-09-19
### Bug Fixes
- Fixing issue that routing table keeps updating due to AWS API
- Seeing issues with names over 32 characters moving to name_prefix to fix the issue
- fixing output value should be id not result

### Code Refactoring
- updating changelog config
- removing commented out code

### Features
- Adding AWS Region as an output
- making information more readable

### Reverts
- Merge branch 'release/v0.1.1' into develop

### Pull Requests
- Merge pull request [#1](https://github.com/pcanham/terraform-module-aws-vpc/issues/1) from pcanham/develop


<a name="v0.1.4"></a>
## [v0.1.4] - 2019-09-05

<a name="v0.1.3"></a>
## [v0.1.3] - 2019-09-05

<a name="v0.1.2"></a>
## [v0.1.2] - 2019-08-30

<a name="v0.1.1"></a>
## [v0.1.1] - 2019-08-27

<a name="v0.1.0"></a>
## v0.1.0 - 2019-07-12

[Unreleased]: https://github.com/pcanham/terraform-module-aws-vpc/compare/v0.1.21...HEAD
[v0.1.21]: https://github.com/pcanham/terraform-module-aws-vpc/compare/v0.1.20...v0.1.21
[v0.1.20]: https://github.com/pcanham/terraform-module-aws-vpc/compare/v0.1.19...v0.1.20
[v0.1.19]: https://github.com/pcanham/terraform-module-aws-vpc/compare/v0.1.18...v0.1.19
[v0.1.18]: https://github.com/pcanham/terraform-module-aws-vpc/compare/v0.1.17...v0.1.18
[v0.1.17]: https://github.com/pcanham/terraform-module-aws-vpc/compare/v0.1.16...v0.1.17
[v0.1.16]: https://github.com/pcanham/terraform-module-aws-vpc/compare/v0.1.15...v0.1.16
[v0.1.15]: https://github.com/pcanham/terraform-module-aws-vpc/compare/v0.1.14...v0.1.15
[v0.1.14]: https://github.com/pcanham/terraform-module-aws-vpc/compare/v0.1.13...v0.1.14
[v0.1.13]: https://github.com/pcanham/terraform-module-aws-vpc/compare/v0.1.12...v0.1.13
[v0.1.12]: https://github.com/pcanham/terraform-module-aws-vpc/compare/v0.1.11...v0.1.12
[v0.1.11]: https://github.com/pcanham/terraform-module-aws-vpc/compare/v0.1.10...v0.1.11
[v0.1.10]: https://github.com/pcanham/terraform-module-aws-vpc/compare/v0.1.9...v0.1.10
[v0.1.9]: https://github.com/pcanham/terraform-module-aws-vpc/compare/v0.1.8...v0.1.9
[v0.1.8]: https://github.com/pcanham/terraform-module-aws-vpc/compare/v0.1.7...v0.1.8
[v0.1.7]: https://github.com/pcanham/terraform-module-aws-vpc/compare/v0.1.6...v0.1.7
[v0.1.6]: https://github.com/pcanham/terraform-module-aws-vpc/compare/v0.1.5...v0.1.6
[v0.1.5]: https://github.com/pcanham/terraform-module-aws-vpc/compare/v0.1.4...v0.1.5
[v0.1.4]: https://github.com/pcanham/terraform-module-aws-vpc/compare/v0.1.3...v0.1.4
[v0.1.3]: https://github.com/pcanham/terraform-module-aws-vpc/compare/v0.1.2...v0.1.3
[v0.1.2]: https://github.com/pcanham/terraform-module-aws-vpc/compare/v0.1.1...v0.1.2
[v0.1.1]: https://github.com/pcanham/terraform-module-aws-vpc/compare/v0.1.0...v0.1.1
