# 1. Create a Helm repository using AWS S3 bucket
# 2. Deliver Small App for K8S and a Helm Chart
# 3. Create a Github action that upon merge to a certain branch packages the application’s Helm chart and pushes it to the S3 repository

## PART 1

- The s3 bucket should be created using Terraform.
- Once the bucket is ready, push some example charts into the repository

Before you run terrafrom in part1 folder you need to export the folowing variables:
```
export AWS_ACCESS_KEY_ID='YOUR KEY ID'
export AWS_SECRET_ACCESS_KEY='YOUR KEY'
export TF_VAR_bucket_name='your unique bucket name'

```

## Create the bucket in s3




docker run -d --rm -p 5000:5000 -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e BUCKET_NAME s3bucket:v1