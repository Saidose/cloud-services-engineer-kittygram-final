output "vm_public_ip" {
  description = "Статический IP ВМ."
  value       = yandex_vpc_address.kittygram.external_ipv4_address[0].address
}

output "kittygram_url" {
  description = "Адрес Kittygram."
  value       = "http://${yandex_vpc_address.kittygram.external_ipv4_address[0].address}"
}

output "ssh_command" {
  description = "Команда SSH для ВМ."
  value       = "ssh yc-user@${yandex_vpc_address.kittygram.external_ipv4_address[0].address}"
}
