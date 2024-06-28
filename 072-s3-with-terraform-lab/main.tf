# create finance-bucket resource
resource "aws_s3_bucket" "finance-bucket" {
  bucket        = "finance-2024"
  force_destroy = true
  tags = {
    Description = "Finance and Payroll"
  }
}

# upload an object to finance-bucket
resource "aws_s3_bucket_object" "payments-file-upload" {
  source = "payments.csv"
  key    = "payments"
  bucket = aws_s3_bucket.finance-bucket.bucket
}

# create a data source for finance-analysts security group
# since this group is not managed by terraform
# because it was created with the CLI
data "aws_iam_group" "finance-analysts-group-data" {
  group_name = "finance-analysts"
}

# create pepe user
resource "aws_iam_user" "pepe-user" {
  name          = "pepe"
  force_destroy = true
}

# add pepe to finance-analysts security group
resource "aws_iam_user_group_membership" "pepe-membership" {
  user = aws_iam_user.pepe-user.name
  groups = [
    data.aws_iam_group.finance-analysts-group-data.group_name
  ]
}

# create a IAM policy called FinantialPolicy
# which allows all actions on finance-2024 bucket
# and allows to list all buckets
resource "aws_iam_policy" "finance-2024-policy" {
  name        = "FinantialPolicy"
  path        = "/"
  description = "Allow all actions on finance-2024 bucket"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:ListAllMyBuckets"
        ]
        Effect : "Allow",
        Resource = "*"
      },
      {
        Action = [
          "s3:*"
        ]
        Effect   = "Allow"
        Resource = "${aws_s3_bucket.finance-bucket.arn}/*"
      }
    ]
  })
}

# attach finance-2024-policy to finance-analysts security group
resource "aws_iam_policy_attachment" "finance-2024-policy-attachment" {
  name       = "finance-2024-policy-attachment"
  groups     = [data.aws_iam_group.finance-analysts-group-data.group_name]
  policy_arn = aws_iam_policy.finance-2024-policy.arn
}
