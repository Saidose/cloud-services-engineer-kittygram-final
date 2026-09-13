variable "yc_token" {
  type      = string
  default   = null
  nullable  = true
  sensitive = true
}

variable "yc_service_account_key_file" {
  type      = string
  default   = null
  nullable  = true
  sensitive = true
}

variable "yc_cloud_id" {
  type = string
}

variable "yc_folder_id" {
  type = string
}

variable "state_bucket_name" {
  description = "Уникальное имя S3-бакета для state."
  type        = string
}

variable "s3_access_key" {
  description = "ID статического ключа S3."
  type        = string
  sensitive   = true
}

variable "s3_secret_key" {
  description = "Секрет статического ключа S3."
  type        = string
  sensitive   = true
}
