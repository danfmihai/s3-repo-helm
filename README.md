# 1. Create a Helm repository using AWS S3 bucket
# 2. Deliver Small App for K8S and a Helm Chart
# 3. Create a Github action that upon merge to a certain branch packages the application’s Helm chart and pushes it to the S3 repository


## Prerequisites:

Before you run terrafrom in part1 folder you need to export the folowing variables:
```
export AWS_ACCESS_KEY_ID='your id'
export AWS_SECRET_ACCESS_KEY='your key'
export TF_VAR_bucket_name='your-helm-repo-name'
export TF_VAR_folder_to_upload='sample'  # repository folder
export AWS_REGION='us-east-1'  # required if you run the helm pluging to initialize s3 folder

```
Installed on the machine you're running this repo:
- aws cli 
- helm

## PART 1

- The s3 bucket should be created using Terraform.
- Once the bucket is ready, push some example charts into the repository

Before you run Terraform check the `helm.auto.tfvars` file and change with your values. Read more info in `variable.tf` about each variable.
There's also a sample helm chart package included, but if you want to add yours you can add it in the same folder and change the name of it in `helm.auto.tfvars`

In order to create the bucket in aws we run:
```
cd part1
terraform init
terraform apply -auto-approve
```
Bucket should be created


## Create the bucket in s3




#docker run -d --rm -p 5000:5000 -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e BUCKET_NAME s3bucket:v1