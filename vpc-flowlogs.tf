resource "random_pet" "log_group" { }

resource "aws_cloudwatch_log_group" "LogGroup-Accept" {
  name = lower(
    format(
      "/%s/%s/vpc/flowlog-accept-%s",
      var.project_tag,
      var.environment_tag,
      random_pet.log_group.result,
    ),
  )
  retention_in_days = var.vpcflow_log_accepted_retention
}

resource "aws_cloudwatch_log_group" "LogGroup-Reject" {
  name = lower(
    format(
      "/%s/%s/vpc/flowlog-reject-%s",
      var.project_tag,
      var.environment_tag,
      random_pet.log_group.result,
    ),
  )
  retention_in_days = var.vpcflow_log_rejected_retention
}

resource "aws_flow_log" "VpcFlowLog-Reject" {

  log_destination_type = "cloud-watch-logs"
  log_destination      = aws_cloudwatch_log_group.LogGroup-Reject.arn
  iam_role_arn = aws_iam_role.VpCFlowLogRole.arn
  vpc_id       = aws_vpc.pro.id
  traffic_type = "REJECT"
}

resource "aws_flow_log" "VpcFlowLog-Accept" {

  log_destination_type = "cloud-watch-logs"
  log_destination      = aws_cloudwatch_log_group.LogGroup-Accept.arn
  iam_role_arn = aws_iam_role.VpCFlowLogRole.arn
  vpc_id       = aws_vpc.pro.id
  traffic_type = "ACCEPT"
}

resource "aws_iam_role" "VpCFlowLogRole" {
  name_prefix = lower(
    format(
      "VpCFlowLogRole-%s-%s-%s",
      var.project_tag,
      var.environment_tag,
      random_pet.log_group.result,
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
  name_prefix = lower(
    format(
      "VpCFlowLogPolicy-%s-%s-%s",
      var.project_tag,
      var.environment_tag,
      random_pet.log_group.result,
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
