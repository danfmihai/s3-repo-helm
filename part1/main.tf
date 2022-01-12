# Create a bucket in s3 with the environment variable TF_VAR_bucket_name. Make sure you export this value!
module "s3" {
  source        = "./s3"
  acl_value     = var.acl_value
  bucket_name   = var.bucket_name
  versioning    = var.versioning
  force_destroy = var.force_destroy
}

locals {
  folder_name = trim(aws_s3_bucket_object.helm_repo_folder.id, "/")
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
  #checks if plugin exists and if not it will install it
  provisioner "local-exec" {
    command = " if [ -z $(helm plugin list | grep s3 | awk '{print $1}') ]; then  helm plugin install https://github.com/hypnoglow/helm-s3.git; fi"
  }

  # To install the helm-s3 plugin on your client machine, run the following command: helm plugin install https://github.com/hypnoglow/helm-s3.git
  provisioner "local-exec" {
    command = <<EOT
    helm s3 init s3://${var.bucket_name}/${var.folder_to_upload}
    if [ -z $(helm repo list | grep sample | awk '{print $1}') ]; then 
      helm repo add ${local.folder_name} s3://${module.s3.id}/${local.folder_name}/
    fi  
    EOT
  }
  # push a sample chart into s3 repository
  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command     = " if [ -f ${var.chart_name} ]; then helm s3 push ${var.chart_name} ${local.folder_name}; fi"
  }

}

