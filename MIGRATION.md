# Migration Guide - Version 2.0.0 Breaking Changes

This guide covers the breaking changes introduced in version 2.0.0 of the AWS VPC Terraform module and provides detailed migration steps.

## Overview of Breaking Changes

Version 2.0.0 includes the following breaking changes:

1. **Resource renaming**: Resources have been renamed for better consistency
2. **Count to for_each migration**: All resources using `count` now use `for_each`
3. **Public route table consolidation**: Single shared route table for all public subnets
4. **Variable type changes**: Several variables have more specific types

## Breaking Changes Detail

### 1. Resource Renaming

| Old Resource Name | New Resource Name |
|------------------|-------------------|
| `aws_vpc.pro` | `aws_vpc.main` |
| `aws_subnet.pm_pro_public` | `aws_subnet.public` |
| `aws_subnet.pm_pro_private01` | `aws_subnet.private01` |
| `aws_subnet.pm_pro_private02` | `aws_subnet.private02` |
| `aws_subnet.pm_pro_private03` | `aws_subnet.private03` |
| `aws_subnet.pm_pro_private04` | `aws_subnet.private04` |

### 2. Count to For_Each Migration

All resources now use `for_each` instead of `count`. Resource addresses have changed from:
- `aws_subnet.public[0]` → `aws_subnet.public["0"]`
- `aws_subnet.public[1]` → `aws_subnet.public["1"]`

### 3. Variable Type Changes

| Variable | Old Type | New Type |
|----------|----------|----------|
| `availability_zones` | `list(any)` | `list(string)` |
| `public_cidr_blocks` | `list(any)` | `list(string)` |
| `private_cidr_blocks0*` | `list(any)` | `list(string)` |
| `dhcp_domain_name_servers` | `list(any)` | `list(string)` |
| `dhcp_ntp_servers` | `list(any)` | `list(string)` |
| `dhcp_netbios_name_servers` | `list(any)` | `list(string)` |
| `vpcflow_log_accepted_retention` | `string` | `number` |
| `vpcflow_log_rejected_retention` | `string` | `number` |

### 4. Public Route Table Consolidation

Previously, each public subnet had its own route table. Now, all public subnets share a single route table:
- `aws_route_table.public[0]`, `aws_route_table.public[1]`, etc. → `aws_route_table.public`

## Migration Steps

### Step 1: Update Module Version

Update your module source to version 2.0.0:

```hcl
module "vpc" {
  source = "path/to/module"
  # version = "2.0.0" # If using version constraints

  # Your existing configuration...
}
```

### Step 2: Update Variable Values

If you were passing retention periods as strings, convert them to numbers:

```hcl
# OLD
module "vpc" {
  vpcflow_log_accepted_retention = "14"
  vpcflow_log_rejected_retention = "30"
}

# NEW
module "vpc" {
  vpcflow_log_accepted_retention = 14
  vpcflow_log_rejected_retention = 30
}
```

### Step 3: Run Terraform Plan (Expect Changes)

```bash
terraform plan
```

You will see many resources being destroyed and recreated. **DO NOT APPLY YET!**

### Step 4: State Migration Script

Use the following script to migrate your Terraform state. **Customize the variables** at the top based on your configuration:

```bash
#!/bin/bash

# CUSTOMIZE THESE VARIABLES
NUM_PUBLIC_SUBNETS=2
NUM_PRIVATE01_SUBNETS=2
NUM_PRIVATE02_SUBNETS=2
NUM_PRIVATE03_SUBNETS=2
NUM_PRIVATE04_SUBNETS=0
NUM_NAT_GATEWAYS=2  # Set based on your NAT gateway configuration
MODULE_PATH="module.vpc"  # Change if you use a different module name

echo "Starting state migration..."

# VPC rename
terraform state mv "${MODULE_PATH}.aws_vpc.pro" "${MODULE_PATH}.aws_vpc.main"

# Default security group rename
terraform state mv "${MODULE_PATH}.aws_default_security_group.default" "${MODULE_PATH}.aws_default_security_group.default"

# Public subnets: count to for_each
for i in $(seq 0 $((NUM_PUBLIC_SUBNETS - 1))); do
  terraform state mv "${MODULE_PATH}.aws_subnet.public[$i]" "${MODULE_PATH}.aws_subnet.public[\"$i\"]"
done

# Private01 subnets: count to for_each
for i in $(seq 0 $((NUM_PRIVATE01_SUBNETS - 1))); do
  terraform state mv "${MODULE_PATH}.aws_subnet.private01[$i]" "${MODULE_PATH}.aws_subnet.private01[\"$i\"]"
done

# Private02 subnets: count to for_each
for i in $(seq 0 $((NUM_PRIVATE02_SUBNETS - 1))); do
  terraform state mv "${MODULE_PATH}.aws_subnet.private02[$i]" "${MODULE_PATH}.aws_subnet.private02[\"$i\"]"
done

# Private03 subnets: count to for_each (if you use them)
if [ $NUM_PRIVATE03_SUBNETS -gt 0 ]; then
  for i in $(seq 0 $((NUM_PRIVATE03_SUBNETS - 1))); do
    terraform state mv "${MODULE_PATH}.aws_subnet.private03[$i]" "${MODULE_PATH}.aws_subnet.private03[\"$i\"]"
  done
fi

# Private04 subnets: count to for_each (if you use them)
if [ $NUM_PRIVATE04_SUBNETS -gt 0 ]; then
  for i in $(seq 0 $((NUM_PRIVATE04_SUBNETS - 1))); do
    terraform state mv "${MODULE_PATH}.aws_subnet.private04[$i]" "${MODULE_PATH}.aws_subnet.private04[\"$i\"]"
  done
fi

# Public route table consolidation - keep only the first one
terraform state mv "${MODULE_PATH}.aws_route_table.public[0]" "${MODULE_PATH}.aws_route_table.public"
# Remove the other public route tables (they will be destroyed)
for i in $(seq 1 $((NUM_PUBLIC_SUBNETS - 1))); do
  terraform state rm "${MODULE_PATH}.aws_route_table.public[$i]"
done

# Public route table associations: count to for_each
for i in $(seq 0 $((NUM_PUBLIC_SUBNETS - 1))); do
  terraform state mv "${MODULE_PATH}.aws_route_table_association.public[$i]" "${MODULE_PATH}.aws_route_table_association.public[\"$i\"]"
done

# Private route tables: count to for_each
for i in $(seq 0 $((NUM_PRIVATE01_SUBNETS - 1))); do
  terraform state mv "${MODULE_PATH}.aws_route_table.private01[$i]" "${MODULE_PATH}.aws_route_table.private01[\"$i\"]"
  terraform state mv "${MODULE_PATH}.aws_route_table_association.private01[$i]" "${MODULE_PATH}.aws_route_table_association.private01[\"$i\"]"
done

for i in $(seq 0 $((NUM_PRIVATE02_SUBNETS - 1))); do
  terraform state mv "${MODULE_PATH}.aws_route_table.private02[$i]" "${MODULE_PATH}.aws_route_table.private02[\"$i\"]"
  terraform state mv "${MODULE_PATH}.aws_route_table_association.private02[$i]" "${MODULE_PATH}.aws_route_table_association.private02[\"$i\"]"
done

if [ $NUM_PRIVATE03_SUBNETS -gt 0 ]; then
  for i in $(seq 0 $((NUM_PRIVATE03_SUBNETS - 1))); do
    terraform state mv "${MODULE_PATH}.aws_route_table.private03[$i]" "${MODULE_PATH}.aws_route_table.private03[\"$i\"]"
    terraform state mv "${MODULE_PATH}.aws_route_table_association.private03[$i]" "${MODULE_PATH}.aws_route_table_association.private03[\"$i\"]"
  done
fi

if [ $NUM_PRIVATE04_SUBNETS -gt 0 ]; then
  for i in $(seq 0 $((NUM_PRIVATE04_SUBNETS - 1))); do
    terraform state mv "${MODULE_PATH}.aws_route_table.private04[$i]" "${MODULE_PATH}.aws_route_table.private04[\"$i\"]"
    terraform state mv "${MODULE_PATH}.aws_route_table_association.private04[$i]" "${MODULE_PATH}.aws_route_table_association.private04[\"$i\"]"
  done
fi

# NAT Gateways and EIPs: count to for_each
if [ $NUM_NAT_GATEWAYS -gt 0 ]; then
  for i in $(seq 0 $((NUM_NAT_GATEWAYS - 1))); do
    terraform state mv "${MODULE_PATH}.aws_eip.nat_ip[$i]" "${MODULE_PATH}.aws_eip.nat_ip[\"$i\"]"
    terraform state mv "${MODULE_PATH}.aws_nat_gateway.nat_gw[$i]" "${MODULE_PATH}.aws_nat_gateway.nat_gw[\"$i\"]"
  done

  # NAT routes
  for i in $(seq 0 $((NUM_PRIVATE01_SUBNETS - 1))); do
    terraform state mv "${MODULE_PATH}.aws_route.private01_ngw[$i]" "${MODULE_PATH}.aws_route.private01_ngw[\"$i\"]"
  done

  for i in $(seq 0 $((NUM_PRIVATE02_SUBNETS - 1))); do
    terraform state mv "${MODULE_PATH}.aws_route.private02_ngw[$i]" "${MODULE_PATH}.aws_route.private02_ngw[\"$i\"]"
  done

  if [ $NUM_PRIVATE03_SUBNETS -gt 0 ]; then
    for i in $(seq 0 $((NUM_PRIVATE03_SUBNETS - 1))); do
      terraform state mv "${MODULE_PATH}.aws_route.private03_ngw[$i]" "${MODULE_PATH}.aws_route.private03_ngw[\"$i\"]"
    done
  fi

  if [ $NUM_PRIVATE04_SUBNETS -gt 0 ]; then
    for i in $(seq 0 $((NUM_PRIVATE04_SUBNETS - 1))); do
      terraform state mv "${MODULE_PATH}.aws_route.private04_ngw[$i]" "${MODULE_PATH}.aws_route.private04_ngw[\"$i\"]"
    done
  fi
fi

# VPC Endpoint associations (if S3 endpoint is enabled)
# Uncomment if you have enable_vpc_s3_endpoint = true
# terraform state mv "${MODULE_PATH}.aws_vpc_endpoint_route_table_association.public_s3[0]" "${MODULE_PATH}.aws_vpc_endpoint_route_table_association.public_s3[\"0\"]"
# for i in $(seq 0 $((NUM_PRIVATE01_SUBNETS - 1))); do
#   terraform state mv "${MODULE_PATH}.aws_vpc_endpoint_route_table_association.private01_s3[$i]" "${MODULE_PATH}.aws_vpc_endpoint_route_table_association.private01_s3[\"$i\"]"
# done
# Similar for private02, private03, private04...

echo "State migration complete!"
echo "Now run 'terraform plan' to verify no changes are needed."
```

### Step 5: Save and Run the Script

1. Save the script as `migrate_state.sh`
2. Make it executable: `chmod +x migrate_state.sh`
3. **BACKUP YOUR STATE FIRST**: `terraform state pull > backup.tfstate`
4. Run the script: `./migrate_state.sh`

### Step 6: Verify Migration

```bash
terraform plan
```

You should see minimal changes, primarily:
- The extra public route tables being destroyed (this is expected)
- Any new outputs being computed

### Step 7: Apply Changes

Once the plan looks correct:

```bash
terraform apply
```

## New Features in Version 2.0.0

- **KMS encryption for VPC Flow Logs**: Set `vpcflow_log_kms_key_id` to use customer-managed keys
- **VPC S3 Endpoint Policy**: Use `vpc_s3_endpoint_policy` to customize S3 endpoint access
- **CIDR validation**: All CIDR block variables now validate input format
- **Additional outputs**: New outputs for IGW, default SG, flow logs, and DHCP options
- **Better NAT Gateway logic**: Clearer local variables for NAT gateway configuration

## Rollback Procedure

If you need to rollback:

1. Restore your state backup:
   ```bash
   terraform state push backup.tfstate
   ```

2. Downgrade to the previous module version

3. Run `terraform plan` to verify

## Support

If you encounter issues during migration:

1. Check that you customized all variables in the migration script
2. Ensure you backed up your state file
3. Review the Terraform plan output carefully before applying
4. Open an issue in the repository with details about your configuration

## Summary

This migration requires careful state manipulation but ensures:
- More predictable resource management with `for_each`
- Better resource naming conventions
- Improved type safety
- Cost savings from consolidated public route table

The migration script handles most of the complexity, but always review the plan before applying changes to production environments.
