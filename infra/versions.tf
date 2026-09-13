terraform {
  required_version = ">= 1.16.1"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "= 0.225.0"
    }
  }

  # Бакет и путь к state задаются при terraform init.
  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    region                      = "ru-central1"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}

provider "yandex" {
  token                    = var.yc_token
  service_account_key_file = var.yc_service_account_key_file
  cloud_id                 = var.yc_cloud_id
  folder_id                = var.yc_folder_id
  zone                     = var.zone
}
