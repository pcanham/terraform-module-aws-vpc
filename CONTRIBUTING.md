# Contributing Guide

Thank you for contributing to the AWS VPC Terraform Module! This guide will help you understand our development workflow and tooling.

## Table of Contents

- [Development Setup](#development-setup)
- [Commit Message Convention](#commit-message-convention)
- [Changelog Generation](#changelog-generation)
- [Documentation](#documentation)
- [Testing](#testing)
- [Pre-commit Hooks](#pre-commit-hooks)
- [Release Process](#release-process)

## Development Setup

### Prerequisites

Install the required tools:

```bash
# macOS
brew install terraform terraform-docs tflint trivy git-chglog pre-commit go-task

# Or use the versions from the project
terraform version  # >= 1.5
task --version     # Task runner
```

### Initialize Project

```bash
# Initialize project (install pre-commit hooks)
task init

# Or manually
pre-commit install
```

## Commit Message Convention

This project follows the [Conventional Commits](https://www.conventionalcommits.org/) specification for clear and automated changelog generation.

### Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Code style changes (formatting, missing semicolons, etc.)
- **refactor**: Code refactoring (neither fixes a bug nor adds a feature)
- **perf**: Performance improvements
- **test**: Adding or updating tests
- **build**: Build system or external dependency changes
- **ci**: CI/CD pipeline changes
- **chore**: Other changes that don't modify src or test files
- **revert**: Reverts a previous commit
- **deprecated**: Deprecation warnings
- **security**: Security improvements

### Scope

The scope is optional and can be anything specifying the place of the commit change:
- `vpc`, `subnets`, `nat`, `routing`, `vpc-flowlogs`, `vpc-endpoint`, `variables`, `outputs`, etc.

### Examples

```bash
# New feature
feat(vpc-endpoint): add S3 endpoint policy support

# Bug fix
fix(nat): resolve NAT gateway count calculation

# Breaking change
refactor(subnets)!: migrate from count to for_each

BREAKING CHANGE: Subnet resources now use for_each instead of count.
Resource addresses change from [0] to ["0"].

# Documentation
docs: update README with usage examples

# Multiple scopes
feat(vpc,subnets): add IPAM support for automated CIDR allocation
```

### Breaking Changes

For breaking changes, add `!` after the type/scope and include `BREAKING CHANGE:` in the footer:

```bash
refactor(vpc)!: rename VPC resources for consistency

BREAKING CHANGE: Resource names have changed
- aws_vpc.pro → aws_vpc.main
- Requires state migration for existing deployments
```

## Changelog Generation

This project uses [git-chglog](https://github.com/git-chglog/git-chglog) for automated changelog generation based on git commits.

### Quick Start

```bash
# Generate changelog for all releases
task changelog

# Or use the script directly
./scripts/generate-changelog.sh
```

### Generate Changelog with Unreleased Commits

When preparing a release, include unreleased commits with the next tag:

```bash
# Using task
task changelog:next TAG=v2.0.0

# Using script directly
./scripts/generate-changelog.sh v2.0.0
```

### Check if Changelog Needs Updating

```bash
# Check if CHANGELOG needs updating
task changelog:check

# Show unreleased commits
task changelog:unreleased
# or
./scripts/generate-changelog.sh --unreleased
```

### Manual Generation

```bash
# All releases
git-chglog -o CHANGELOG.md

# With next tag for unreleased commits
git-chglog --next-tag v2.0.0 -o CHANGELOG.md

# Specific tag
git-chglog v1.0.0

# Between tags
git-chglog v1.0.0..v2.0.0
```

### Pre-commit Hook

The git-chglog pre-commit hook is configured but runs manually to avoid conflicts:

```bash
# Generate changelog via pre-commit
task pre-commit:changelog

# Or directly
pre-commit run git-chglog --hook-stage manual --all-files
```

### Configuration

The changelog configuration is in `.chglog/config.yml`:
- Template: `.chglog/CHANGELOG.tpl.md`
- Style: GitHub-compatible
- Repository URL: Automatically uses GitLab URL
- Format: Based on [Keep a Changelog](https://keepachangelog.com/)

## Documentation

### Generate Module Documentation

Documentation is auto-generated using [terraform-docs](https://terraform-docs.io/):

```bash
# Generate documentation
task docs

# Or manually
terraform-docs markdown table . --output-file README.md --output-mode inject
```

The documentation is injected between these markers in README.md:
```markdown
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
...generated content...
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
```

### Documentation Standards

- Keep README.md comprehensive with examples
- Update MIGRATION.md for breaking changes
- Add inline comments for complex logic
- Include usage examples for new features

## Testing

### Run All Tests

```bash
# Run all tests (fmt, validate, docs check)
task test

# Run comprehensive tests including security
task test:all
```

### Individual Tests

```bash
# Format Terraform files
task fmt

# Check formatting
task fmt:check

# Validate Terraform configuration
task validate

# Run linter
task lint

# Run security scans
task security

# Run pre-commit hooks
task pre-commit
```

### Security Scanning

Pre-commit hooks include:
- **tflint**: Terraform linting
- **trivy**: Security vulnerability scanning
- **gitleaks**: Secret detection
- **terraform_validate**: Configuration validation

## Pre-commit Hooks

### Available Hooks

1. **trailing-whitespace**: Remove trailing whitespace
2. **end-of-file-fixer**: Ensure files end with newline
3. **detect-aws-credentials**: Prevent AWS credentials in code
4. **detect-private-key**: Prevent private keys in code
5. **check-symlinks**: Verify symlinks
6. **gitleaks**: Scan for secrets
7. **prettier**: Format YAML/JSON files
8. **terraform_fmt**: Format Terraform files
9. **terraform_validate**: Validate Terraform
10. **terraform_tflint**: Lint Terraform
11. **terraform_trivy**: Security scanning
12. **terraform-docs-go**: Generate documentation
13. **git-chglog**: Generate changelog (manual stage)

### Running Hooks

```bash
# Install hooks
pre-commit install

# Run on all files
pre-commit run --all-files

# Run specific hook
pre-commit run terraform_fmt --all-files

# Update hook versions
make pre-commit-update
```

### Skip Hooks

To skip hooks temporarily (use sparingly):

```bash
git commit --no-verify -m "commit message"
```

## Release Process

### 1. Prepare Release

```bash
# Check unreleased commits
task changelog:unreleased

# Ensure all tests pass
task test

# Update documentation
task docs
```

### 2. Generate Changelog

```bash
# Generate changelog with next version
task changelog:next TAG=v2.0.0

# Review the changes
git diff CHANGELOG.md
```

### 3. Update Version References

If applicable, update:
- Version badges in README.md
- Example version constraints
- MIGRATION.md version references

### 4. Create Release Commit

```bash
# Commit changelog and any version updates
git add CHANGELOG.md
git commit -m "chore: release v2.0.0"
```

### 5. Tag Release

```bash
# Create annotated tag
git tag -a v2.0.0 -m "Release v2.0.0"

# Push tag
git push origin v2.0.0
```

### 6. Regenerate Final Changelog

```bash
# Regenerate changelog now that tag exists
task changelog

# Commit if changed
git add CHANGELOG.md
git commit --amend --no-edit
git push --force-with-lease
```

### 7. GitLab Release

The GitLab CI pipeline should automatically:
1. Run tests
2. Generate documentation
3. Create GitLab release
4. Publish to Terraform registry (if configured)

## Task Reference

View all available tasks:
```bash
task --list-all
# or
task help
```

Common tasks:
```bash
# Project Setup
task init                      # Initialize project (install hooks)

# Changelog
task changelog                 # Generate CHANGELOG.md
task changelog:next TAG=v2.0.0 # Generate with unreleased commits
task changelog:unreleased      # Show unreleased commits
task changelog:check           # Check if CHANGELOG needs update

# Documentation
task docs                      # Generate documentation
task docs:check                # Check if docs are up to date

# Testing
task test                      # Run all tests
task test:all                  # Run comprehensive tests + security
task fmt                       # Format Terraform files
task fmt:check                 # Check formatting
task validate                  # Validate configuration
task lint                      # Run tflint
task security                  # Run security scans

# Pre-commit
task pre-commit                # Run pre-commit hooks
task pre-commit:install        # Install hooks
task pre-commit:update         # Update hook versions
task pre-commit:changelog      # Run git-chglog hook

# Release
task release:prepare TAG=v2.0.0  # Prepare release
task release:tag TAG=v2.0.0      # Create and push tag
task version                     # Show current version
task version:next                # Suggest next version

# Cleanup
task clean                     # Clean generated files
```

## GitLab CI/CD

The project uses GitLab CI with a reusable component:

```yaml
include:
  - component: gitlab.localrealm.net/automation/gitlabci-templates/terraform-module@0.1.31
    inputs:
      module_name: aws-vpc
```

The component handles:
- Terraform validation and testing
- Security scanning
- Documentation generation
- Changelog generation
- Release creation
- Terraform registry publishing

## Common Workflows

### Adding a New Feature

```bash
# Create feature branch
git checkout -b feature/my-new-feature

# Make changes and commit
git add .
git commit -m "feat(vpc): add new feature"

# Run tests
task test

# Generate docs
task docs

# Push and create MR
git push origin feature/my-new-feature
```

### Fixing a Bug

```bash
# Create fix branch
git checkout -b fix/bug-description

# Make changes
git add .
git commit -m "fix(subnets): resolve subnet creation issue"

# Test
task test

# Push
git push origin fix/bug-description
```

### Preparing a Release

```bash
# Ensure on main branch
git checkout main
git pull origin main

# Generate changelog
task changelog:next TAG=v2.0.0

# Review and commit
git add CHANGELOG.md
git commit -m "chore: release v2.0.0"

# Tag and push
git tag -a v2.0.0 -m "Release v2.0.0"
git push origin main --tags
```

## Getting Help

- Check existing issues on GitLab
- Review [MIGRATION.md](MIGRATION.md) for upgrade guidance
- Read the comprehensive [README.md](README.md)
- Contact module maintainers

## Code Style

- Follow Terraform best practices
- Use `for_each` over `count` for predictability
- Add meaningful comments for complex logic
- Keep functions focused and single-purpose
- Use descriptive variable names
- Add validation for inputs where appropriate

## Questions?

If you have questions or need help:
1. Check this contributing guide
2. Review existing issues and discussions
3. Open a new issue with your question

Thank you for contributing! 🎉
