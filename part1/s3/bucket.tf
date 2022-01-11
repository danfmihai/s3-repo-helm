resource aws_s3_bucket helm_bucket{
    bucket = var.bucket_name
    acl    = var.acl_value
    force_destroy = var.force_destroy
    versioning {
       enabled = var.versioning
  }
}
