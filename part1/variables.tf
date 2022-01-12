
variable "bucket_name" {
  type        = string
  default     = ""
  description = "Name of the bucket to create in aws s3"
}

variable "force_destroy" {
  type        = bool
  description = "A boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable"
}

variable "versioning" {
  type        = bool
  description = "A state of versioning "
}

variable "acl_value" {
  type        = string
  default     = ""
  description = "description"
}

variable "folder_to_upload" {
  type = string
}

variable "chart_name" {
  type = string
}