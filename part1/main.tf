# Create a bucket in s3 with the environment variable TF_VAR_bucket_name. Make sure you export this value!
module "s3" {
  source        = "./s3"
  acl_value     = var.acl_value
  bucket_name   = var.bucket_name
  versioning    = var.versioning
  force_destroy = var.force_destroy
}

#create folder to host helm resository
resource "aws_s3_bucket_object" "helm_repo_folder" {
  depends_on = [
    module.s3
  ]
  bucket = var.bucket_name
  key    = "${var.folder_to_upload}/"
}

# init the folder as Helm Repository
resource "null_resource" "init_helm" {
   depends_on = [
     aws_s3_bucket_object.helm_repo_folder
   ]
  # make sure you have installed the 
  # init the s3 bucket as a helm s3 plugin
  # To install the helm-s3 plugin on your client machine, run the following command: helm plugin install https://github.com/hypnoglow/helm-s3.git
  provisioner "local-exec" {
    command = "helm s3 init s3://${var.bucket_name}/${var.folder_to_upload}"
  }
}

