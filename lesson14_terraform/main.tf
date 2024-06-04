terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = "y0_AgAAAAAZbyBYAATuwQAAAAEGo_hhAAA8nFeIZfNHv6dJvHnZPWAoAe4rKQ"
  cloud_id  = "b1grj8lc5483i0q6rtqd"
  folder_id = "b1giqjjdqjccqqii53cf"
  zone      = "ru-central1-a"
}

resource "yandex_compute_disk" "boot-disk-1" {
  name     = "boot-disk-1"
  type     = "network-hdd"
  zone     = "ru-central1-a"
  size     = "20"
  image_id = "fd8di2mid9ojikcm93en"
}

resource "yandex_compute_disk" "boot-disk-2" {
  name     = "boot-disk-2"
  type     = "network-hdd"
  zone     = "ru-central1-a"
  size     = "20"
  image_id = "fd8di2mid9ojikcm93en"
}

resource "yandex_compute_instance" "vm-1" {
  name        = "cloud-vm1"
  description = "build"
  platform_id = "standard-v1"

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot-disk-1.id
  }

  network_interface {
    index     = 34
    subnet_id = "e9b3ld59aqlqtrhrgfgf"
    nat       = true
  }

  metadata = {
    user-data = "${file("/root/cloud-terraform/user-data.yml")}"
  }
}

resource "yandex_compute_instance" "vm-2" {
  name        = "cloud-vm2"
  description = "web"
  platform_id = "standard-v1"

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot-disk-2.id
  }

  network_interface {
    index     = 35
    subnet_id = "e9b3ld59aqlqtrhrgfgf"
    nat       = true
  }

  metadata = {
    user-data = "${file("/root/cloud-terraform/user-data.yml")}"
  }
}

output "internal_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}

output "internal_ip_address_vm_2" {
  value = yandex_compute_instance.vm-2.network_interface.0.ip_address
}

output "external_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}

output "external_ip_address_vm_2" {
  value = yandex_compute_instance.vm-2.network_interface.0.nat_ip_address
}