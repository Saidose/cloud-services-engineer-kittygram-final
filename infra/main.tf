data "yandex_compute_image" "ubuntu" {
  family = var.image_family
}

resource "yandex_vpc_network" "kittygram" {
  name = "kittygram-network"
}

resource "yandex_vpc_subnet" "kittygram" {
  name           = "kittygram-subnet"
  zone           = var.zone
  network_id     = yandex_vpc_network.kittygram.id
  v4_cidr_blocks = [var.subnet_cidr]
}

resource "yandex_vpc_security_group" "kittygram" {
  name        = "kittygram-security-group"
  network_id  = yandex_vpc_network.kittygram.id
  description = "Доступ только по SSH и HTTP."

  ingress {
    protocol       = "TCP"
    description    = "Доступ по SSH"
    port           = 22
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol       = "TCP"
    description    = "HTTP Kittygram"
    port           = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol       = "ANY"
    description    = "Весь исходящий трафик"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}

# Статический IP сохраняется после перезапуска ВМ.
resource "yandex_vpc_address" "kittygram" {
  name = "${var.instance_name}-public-ip"

  external_ipv4_address {
    zone_id = var.zone
  }
}

resource "yandex_compute_instance" "kittygram" {
  name                      = var.instance_name
  allow_stopping_for_update = true

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  scheduling_policy {
    # ВМ не прерывается Yandex Cloud.
    preemptible = false
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = 20
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.kittygram.id
    nat                = true
    nat_ip_address     = yandex_vpc_address.kittygram.external_ipv4_address[0].address
    security_group_ids = [yandex_vpc_security_group.kittygram.id]
  }

  metadata = {
    user-data = templatefile("${path.module}/cloud-init.yaml.tftpl", {
      ssh_public_key = var.ssh_public_key
    })
  }

  labels = {
    project = "kittygram"
    managed = "terraform"
  }
}
