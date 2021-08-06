provider "aws" {
  profile = "default"
  region  = var.region  
}

resource "aws_s3_bucket" "s" {
    bucket = var.source_bucket
    acl = "private"
    force_destroy = "true"
}

resource "aws_s3_bucket" "d" {
    bucket = var.destination_bucket
    acl = "private"
    force_destroy = "true"
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "rmr_lambda" {
  filename = "test.zip"
  function_name = "rmr_s3_lambda"
  role = aws_iam_role.iam_for_lambda.arn
  handler = "lambda_handler"
  
  runtime = "python3.8"
}

