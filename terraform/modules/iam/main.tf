resource "aws_iam_role" "role" {
  name = var.role_name

  assume_role_policy = <<EOT
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "${var.assume_role_service}"
        },
        "Action": "sts:AssumeRole"
      }
    ]
  }
  EOT

  tags = {
    Name = var.role_name
  }
}

resource "aws_iam_policy" "policy" {
  name        = var.policy_name
  description = var.policy_description

  policy = var.policy_document
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}
