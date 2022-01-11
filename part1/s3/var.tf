variable bucket_name {
  type        = string
  description = "Bucket name"
}

variable acl_value {
  type        = string
  default = "private"
}

variable versioning {
  type        = bool
  default     = false
  description = "Enable/disable versioning"
}

variable force_destroy {
  type        = bool
  default     = false
  description = "A boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable"
}


