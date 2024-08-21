resource "aws_s3_object" "scripts_folder" {
  bucket = aws_s3_bucket.terraform-bucket.bucket
  key    = "files/scripts/"
}

resource "aws_s3_object" "unzips_folder" {
  bucket = aws_s3_bucket.terraform-bucket.bucket
  key    = "files/unzips/"
}