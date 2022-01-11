module "s3" {
  source        = "./s3"
  acl_value     = var.acl_value
  bucket_name   = var.bucket_name
  versioning    = var.versioning
  force_destroy = var.force_destroy
}