terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  token = var.token
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  zone = var.zone
}

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_disk" "disk-med" {
  name     = "disk-med"
  type     = var.hardware
  zone     = var.zone
  size     = "10"
  image_id = data.yandex_compute_image.ubuntu.image_id
}

resource "yandex_compute_disk" "disk-admin" {
  name     = "disk-admin"
  type     = var.hardware
  zone     = var.zone
  size     = "10"
  image_id = data.yandex_compute_image.ubuntu.image_id
}

resource "yandex_compute_disk" "disk-ai" {
  name     = "disk-ai"
  type     = var.hardware
  zone     = var.zone
  size     = "20"
  image_id = data.yandex_compute_image.ubuntu.image_id
}

resource "yandex_compute_disk" "disk-fin" {
  name     = "disk-fin"
  type     = var.hardware
  zone     = var.zone
  size     = "10"
  image_id = data.yandex_compute_image.ubuntu.image_id
}
 
resource "yandex_compute_instance" "vmmed" {
  name = "vm-med"

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    disk_id = yandex_compute_disk.disk-med.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_public_key}"
  }
}

resource "yandex_compute_instance" "vmadmin" {
  name = "vm-admin"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    disk_id = yandex_compute_disk.disk-admin.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_public_key}"
  }
}

resource "yandex_compute_instance" "vmai" {
  name = "vm-ai"

  resources {
    cores  = 8
    memory = 8
  }

  boot_disk {
    disk_id = yandex_compute_disk.disk-ai.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_public_key}"
  }
}

resource "yandex_compute_instance" "vmfin" {
  name = "vm-fin"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    disk_id = yandex_compute_disk.disk-fin.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_public_key}"
  }
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = var.zone
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}



