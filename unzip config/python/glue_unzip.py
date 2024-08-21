import boto3
import zipfile
import io

source_bucket = 'quannm-07252024-demo'
source_key = 'files/temporary/demo.zip'
destination_bucket = 'terraform-08212024-bucket'
destination_key = 'files/unzips'

def save_zip_contents_to_s3(source_bucket, source_key, destination_bucket, destination_key):
    s3_client = boto3.client('s3')

    # Tải file Zip từ S3 của Tài khoản 1
    response = s3_client.get_object(Bucket=source_bucket, Key=source_key)
    zip_content = response['Body'].read()

    with zipfile.ZipFile(io.BytesIO(zip_content), 'r') as zip_ref:
        file_list = zip_ref.namelist()

        for file_name in file_list:
            with zip_ref.open(file_name) as file:
                content = file.read()
                output_key = f"{destination_key}/{file_name}"
                
                # Ghi file giải nén vào S3 của Tài khoản 2
                s3_client.put_object(Bucket=destination_bucket, Key=output_key, Body=content)
                print(f"Đã lưu {file_name} vào S3: s3://{destination_bucket}/{output_key}")

save_zip_contents_to_s3(source_bucket, source_key, destination_bucket, destination_key)
