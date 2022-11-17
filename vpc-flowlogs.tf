#tfsec:ignore:aws-cloudwatch-log-group-customer-key
resource "aws_cloudwatch_log_group" "LogGroup-Accept" {
  #checkov:skip=CKV_AWS_158:Customer choice on using custom KMS key, will be down to security versus cost
  name_prefix = lower(
    format(
      "/%s/%s/vpc/flowlog-accept_",
      var.project_tag,
      var.environment_tag,
    ),
  )
  retention_in_days = var.vpcflow_log_accepted_retention
  tags              = var.tags
}

#tfsec:ignore:aws-cloudwatch-log-group-customer-key
resource "aws_cloudwatch_log_group" "LogGroup-Reject" {
  #checkov:skip=CKV_AWS_158:Customer choice on using custom KMS key, will be down to security versus cost
  name_prefix = lower(
    format(
      "/%s/%s/vpc/flowlog-reject_",
      var.project_tag,
      var.environment_tag,
    ),
  )
  retention_in_days = var.vpcflow_log_rejected_retention
  tags              = var.tags
}

resource "aws_flow_log" "VpcFlowLog-Reject" {

  log_destination_type = "cloud-watch-logs"
  log_destination      = aws_cloudwatch_log_group.LogGroup-Reject.arn
  iam_role_arn         = aws_iam_role.vpc_flow_log_cloudwatch.arn
  vpc_id               = aws_vpc.pro.id
  traffic_type         = "REJECT"
  tags                 = var.tags
}

resource "aws_flow_log" "VpcFlowLog-Accept" {

  log_destination_type = "cloud-watch-logs"
  log_destination      = aws_cloudwatch_log_group.LogGroup-Accept.arn
  iam_role_arn         = aws_iam_role.vpc_flow_log_cloudwatch.arn
  vpc_id               = aws_vpc.pro.id
  traffic_type         = "ACCEPT"
  tags                 = var.tags
}

# Create Assume role permissions
data "aws_iam_policy_document" "vpc_flow_logs_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
  }
}

# Create role and assign the assume role permissions
resource "aws_iam_role" "vpc_flow_log_cloudwatch" {
  name_prefix = lower(
    format(
      "VpCFlowLog-%s-%s",
      var.project_tag,
      var.environment_tag,
    ),
  )
  path               = "/system/"
  assume_role_policy = data.aws_iam_policy_document.vpc_flow_logs_assume_role.json
  tags               = var.tags
}


# Create policy document and policy
data "aws_iam_policy_document" "vpc_flow_log_cloudwatch" {

  statement {
    sid = "VPCFlowLogs_To_CloudWatch"

    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_policy" "vpc_flow_log_cloudwatch" {
  name_prefix = "vpc-flow-log-to-cloudwatch-"
  policy      = data.aws_iam_policy_document.vpc_flow_log_cloudwatch.json
  tags        = var.tags
}

# Attach the Policy to role
resource "aws_iam_role_policy_attachment" "vpc_flow_log_cloudwatch" {
  role       = aws_iam_role.vpc_flow_log_cloudwatch.name
  policy_arn = aws_iam_policy.vpc_flow_log_cloudwatch.arn
}
