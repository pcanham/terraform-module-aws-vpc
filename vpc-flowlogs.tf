resource "aws_cloudwatch_log_group" "LogGroup-Accept" {
  name = lower(
    format(
      "/aws/vpc/flowlog-accept-%s-%s",
      var.project_tag,
      var.environment_tag,
    ),
  )
  retention_in_days = var.vpcflow_log_accepted_retention
}

resource "aws_cloudwatch_log_group" "LogGroup-Reject" {
  name = lower(
    format(
      "/aws/vpc/flowlog-aeject-%s-%s",
      var.project_tag,
      var.environment_tag,
    ),
  )
  retention_in_days = var.vpcflow_log_rejected_retention
}

resource "aws_flow_log" "VpcFlowLog-Reject" {

  log_destination_type = "cloud-watch-logs"
  log_destination      = aws_cloudwatch_log_group.LogGroup-Reject.arn
  #log_group_name = aws_cloudwatch_log_group.LogGroup.name
  iam_role_arn = aws_iam_role.VpCFlowLogRole.arn
  vpc_id       = aws_vpc.pro.id
  traffic_type = "REJECT"
}

resource "aws_flow_log" "VpcFlowLog-Accept" {

  log_destination_type = "cloud-watch-logs"
  log_destination      = aws_cloudwatch_log_group.LogGroup-Accept.arn
  #log_group_name = aws_cloudwatch_log_group.LogGroup.name
  iam_role_arn = aws_iam_role.VpCFlowLogRole.arn
  vpc_id       = aws_vpc.pro.id
  traffic_type = "ACCEPT"
}

resource "aws_iam_role" "VpCFlowLogRole" {
  name = lower(
    format(
      "VpCFlowLogRole-%s-%s",
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
}

resource "aws_iam_role_policy" "VpCFlowLogPolicy" {
  name = lower(
    format(
      "VpCFlowLogPolicy-%s-%s",
      var.project_tag,
      var.environment_tag,
    ),
  )
  role = aws_iam_role.VpCFlowLogRole.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
