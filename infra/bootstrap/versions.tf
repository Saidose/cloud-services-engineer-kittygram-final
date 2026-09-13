terraform {
  required_version = ">= 1.16.1"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "= 0.225.0"
    }
  }
}

provider "yandex" {
  token                    = var.yc_token
  service_account_key_file = var.yc_service_account_key_file
  cloud_id                 = var.yc_cloud_id
  folder_id                = var.yc_folder_id
}
