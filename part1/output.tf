output "bucket_name" {
  value = module.s3.id
}

output "bucket_arn" {
  value = module.s3.arn
}

output "Folder_to_create" {
  value = aws_s3_bucket_object.helm_repo_folder.id
}

output Target_repo {
  value = "To add the target repository alias to the Helm client machine \n, use the following command: helm repo add stable-myapp s3://${module.s3.id}/${aws_s3_bucket_object.helm_repo_folder.id}/"
}