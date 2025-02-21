##############################
# Creación del rol para el Canary
##############################
resource "aws_iam_role" "canary_role" {
  name = var.role_name != "" ? var.role_name : "${var.name}-canary-role"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          Service = ["synthetics.amazonaws.com","lambda.amazonaws.com"]
        },
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "canary_policy" {
  name = "${aws_iam_role.canary_role.name}-policy"
  role = aws_iam_role.canary_role.id

  policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "arn:aws:logs:*:*:*"
      },
      {
        Effect   = "Allow",
        Action   = [
          "s3:GetBucketLocation",
          "s3:ListBucket",
          "s3:ListAllMyBuckets"
        ],
        Resource = "*"
      },
      {
        Effect   = "Allow",
        Action   = [
          "s3:GetObject",
          "s3:PutObject"

        ],
        Resource = "*"
      },
      {
        Effect   = "Allow",
        Action   = [
          "cloudwatch:PutMetricData"
        ],
        Resource = "*"
      },
      {
        Effect   = "Allow",
        Action   = [
          "xray:PutTraceSegments",
          "xray:PutTelemetryRecords"
        ],
        Resource = "*"
      }
    ]
  })
}


resource "aws_synthetics_canary" "canary" {
  name                 = "${var.client}-${var.project}-${var.environment}-${var.application}-${var.functionality}"
  artifact_s3_location = var.artifact_s3_location
  execution_role_arn   = aws_iam_role.canary_role.arn
  runtime_version      = var.runtime_version
  handler              = var.handler
  zip_file             = local.zip
  start_canary         = true
  schedule {
    expression          = var.schedule_expression
    duration_in_seconds = var.schedule_duration_in_seconds
  }
  depends_on = [data.archive_file.lambda_canary_zip]
}
