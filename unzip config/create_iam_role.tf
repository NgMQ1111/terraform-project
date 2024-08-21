resource "aws_iam_role" "terraform_glue_role" {
  name = "TerraformGlueAccessS3Role"

  # Trust Policy
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "glue.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Gắn Policy vào Role
resource "aws_iam_role_policy_attachment" "terraform_role_policy_attach" {
  role       = aws_iam_role.terraform_glue_role.name
  policy_arn = aws_iam_policy.terraform_policy.arn
}

output "role_arn" {
  value = aws_iam_role.terraform_glue_role.arn
}
