# 1. Create a Helm repository using AWS S3 bucket
# 2. Deliver Small App for K8S and a Helm Chart
# 3. Create a Github action that upon merge to a certain branch packages the application’s Helm chart and pushes it to the S3 repository


## Prerequisites:

Before you run terrafrom in part1 folder you need to export the folowing variables:
```
export AWS_ACCESS_KEY_ID='AKIAU5AXRVLYZEXPYV53'
export AWS_SECRET_ACCESS_KEY='f/qpeCVi5H0hFoeaDVYS4nVy7WoNCAZRAUWSiXJL'
export TF_VAR_bucket_name='mihai-helm-charts-s3-repository'
export TF_VAR_folder_to_upload='sample'  # repository folder
export AWS_REGION='us-east-1'  # required if you run the helm pluging to initialize s3 folder

```
Installed on the machine you're running this repo:
- aws cli 
- helm

- Also you need to have installed the helm-s3 plugin for Amazon S3. To install the helm-s3 plugin on your client machine, run the following command:
```
helm plugin install https://github.com/hypnoglow/helm-s3.git
```

- To initialize the target folder as a Helm repository, use the following command: 
``` 
helm s3 init s3://<bucket_name>/path/myapp
```



## PART 1

- The s3 bucket should be created using Terraform.
- Once the bucket is ready, push some example charts into the repository


In order to create the bucket in aws we run:
```
cd part1
terraform init
terraform aplly -autoapprove
```
Bucket should be created


## Create the bucket in s3




#docker run -d --rm -p 5000:5000 -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e BUCKET_NAME s3bucket:v1