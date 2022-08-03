#tfsec:ignore:aws-cloudwatch-log-group-customer-key
resource "aws_cloudwatch_log_group" "LogGroup-Accept" {
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
  iam_role_arn         = aws_iam_role.VpCFlowLogRole.arn
  vpc_id               = aws_vpc.pro.id
  traffic_type         = "REJECT"
  tags                 = var.tags
}

resource "aws_flow_log" "VpcFlowLog-Accept" {

  log_destination_type = "cloud-watch-logs"
  log_destination      = aws_cloudwatch_log_group.LogGroup-Accept.arn
  iam_role_arn         = aws_iam_role.VpCFlowLogRole.arn
  vpc_id               = aws_vpc.pro.id
  traffic_type         = "ACCEPT"
  tags                 = var.tags
}

resource "aws_iam_role" "VpCFlowLogRole" {
  name_prefix = lower(
    format(
      "VpCFlowLog-%s-%s",
      var.project_tag,
      var.environment_tag,
    ),
  )

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
  tags               = var.tags
}

resource "aws_iam_role_policy" "VpCFlowLogPolicy" {
  name_prefix = lower(
    format(
      "VpCFlowLog-%s-%s",
      var.project_tag,
      var.environment_tag,
    ),
  )
  role = aws_iam_role.VpCFlowLogRole.id

  #tfsec:ignore:aws-iam-no-policy-wildcards
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}
