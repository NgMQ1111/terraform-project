resource "aws_iam_policy" "terraform_policy" {
  name        = "TerraformS3ReadPolicy"
  description = "An policy to allow S3 access from Terraform"
  
  # Nội dung của policy
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::quannm-07252024-demo",
          "arn:aws:s3:::quannm-07252024-demo/*"
        ]
      },
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::${aws_s3_bucket.terraform-bucket.bucket}",
          "arn:aws:s3:::${aws_s3_bucket.terraform-bucket.bucket}/*"
        ]
      }
    ]
  })
}

output "policy_arn" {
  value = aws_iam_policy.terraform_policy.arn
}
