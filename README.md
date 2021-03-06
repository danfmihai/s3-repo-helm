## 1. Creates a Helm repository using AWS S3 bucket using Terraform
## 2. Deliver Small App for K8S and a Helm Chart


## Prerequisites:

Before you run terrafrom in part1 folder you need to export the folowing variables:
```
export AWS_ACCESS_KEY_ID='your id'
export AWS_SECRET_ACCESS_KEY='your key' # you can find these values in $HOME/.aws/credentials file
export TF_VAR_bucket_name='your-helm-repo-bucket-name' # name of your bucket
export TF_VAR_folder_to_upload='sample'  # repository folder name
export AWS_DEFAULT_REGION='us-east-1'  # required if you run the helm pluging to initialize s3 folder
```
You can use the `export_var.txt` from settings folder to export your environment variables from above. Make sure to enter your own values! Use command :
```
source export_var.txt
```

Install on the machine you're running this repo:
- aws cli 
- helm

## PART 1

- The s3 bucket will be created using Terraform.
- Once the bucket is ready, will push some example chart into the repository (sample-0.1.0.tgz)

Before you run Terraform check the `helm.auto.tfvars` file and change with your values. Read more info in `variable.tf` about each variable.
There's also a sample helm chart package included, but if you want to add yours you can add it in the same folder and change the name of it in `helm.auto.tfvars`

In order to create the bucket in aws we run:
```
cd part1
terraform init
terraform apply -auto-approve
```
Bucket should be created with your exported variable name `TF_VARS_bucket_name` that you set earlier.


## Part 2

The sample app that retrieves the objects from s3 bucket runs in python on port 8001 using gunicorn web server.

A Dockerfile is provided that creates the image of the app ready to be pushed to a repository (dockerhub.com in this case).

Helm and Dockerfile repo: https://github.com/danfmihai/helm-and-dockerfile-part2.git



References:

https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/set-up-a-helm-v3-chart-repository-in-amazon-s3.html

