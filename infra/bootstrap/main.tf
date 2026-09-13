# Бакет нужен до запуска основного Terraform.
resource "yandex_storage_bucket" "terraform_state" {
  bucket     = var.state_bucket_name
  access_key = var.s3_access_key
  secret_key = var.s3_secret_key
  # Новый бакет по умолчанию закрытый.

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}
