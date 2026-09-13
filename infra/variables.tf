variable "yc_token" {
  description = "Краткий IAM-токен для локального запуска."
  type        = string
  default     = null
  nullable    = true
  sensitive   = true
}

variable "yc_service_account_key_file" {
  description = "JSON-ключ сервисного аккаунта для GitHub Actions."
  type        = string
  default     = null
  nullable    = true
  sensitive   = true
}

variable "yc_cloud_id" {
  description = "ID облака."
  type        = string
}

variable "yc_folder_id" {
  description = "ID каталога."
  type        = string
}

variable "zone" {
  description = "Зона ВМ и подсети."
  type        = string
  default     = "ru-central1-a"
}

variable "subnet_cidr" {
  description = "Подсеть Kittygram."
  type        = string
  default     = "10.128.0.0/24"
}

variable "ssh_public_key" {
  description = "Публичный SSH-ключ пользователя yc-user."
  type        = string
  sensitive   = true
}

variable "instance_name" {
  description = "Имя ВМ."
  type        = string
  default     = "kittygram-vm"
}

variable "image_family" {
  description = "Семейство образов Ubuntu."
  type        = string
  default     = "ubuntu-2204-lts"
}
