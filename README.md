# 1. Create a Helm repository using AWS S3 bucket
# 2. Deliver Small App for K8S and a Helm Chart
# 3. Create a Github action that upon merge to a certain branch packages the application’s Helm chart and pushes it to the S3 repository

## PART 1

- The s3 bucket should be created using Terraform.
- Once the bucket is ready, push some example charts into the repository

docker run -d --rm -p 5000:5000 -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e BUCKET_NAME s3bucket:v1