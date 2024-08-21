resource "aws_s3_bucket" "terraform-bucket" {
  bucket = "terraform-08212024-bucket"

  tags = {
    Name = "Terraform Series"
  }
}