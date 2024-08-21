# Upload một file lên thư mục S3
resource "aws_s3_object" "unzip_script_file" {
  bucket = aws_s3_bucket.terraform-bucket.bucket
  key    = "files/scripts/glue_unzip.py"  # Đường dẫn đến file trên S3
  source = "python/glue_unzip.py"  # Đường dẫn tới file trên máy cục bộ

  etag = filemd5("python/glue_unzip.py")  # Sử dụng MD5 hash để nhận diện sự thay đổi
}

# Đầu ra để lấy URL của file đã upload
output "file_url" {
  value = "https://${aws_s3_object.unzip_script_file.bucket}.s3.amazonaws.com/${aws_s3_object.unzip_script_file.key}"
}