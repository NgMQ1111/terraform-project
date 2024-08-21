# Tạo Glue Job
resource "aws_glue_job" "terraform_glue_job" {
  name     = "TerraformGlueETLJob"
  role_arn = aws_iam_role.terraform_glue_role.arn

  command {
    name            = "glueetl"
    script_location = "s3://${aws_s3_object.unzip_script_file.bucket}/${aws_s3_object.unzip_script_file.key}"  # Đường dẫn đến Python script
    python_version  = "3"
  }

  glue_version      = "4.0"
  worker_type       = "G.1X"
  number_of_workers = 2 # Minimum allowed value of Number of Workers is 2

  max_retries = 0  # Số lần thử lại nếu job bị lỗi
  timeout     = 10  # Thời gian tối đa (phút) cho mỗi lần chạy job
}

output "glue_job_name" {
  value = aws_glue_job.terraform_glue_job.name
}