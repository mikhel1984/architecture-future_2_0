
resource "yandex_compute_disk" "disk-med" {
  name     = "disk-med"
  type     = "network-ssd"
  zone     = var.zone
  size     = "20"
  image_id = var.os
}

resource "yandex_compute_disk" "disk-admin" {
  name     = "disk-admin"
  type     = "network-ssd"
  zone     = var.zone
  size     = "20"
  image_id = var.os
}

resource "yandex_compute_disk" "disk-ai" {
  name     = "disk-ai"
  type     = "network-ssd"
  zone     = var.zone
  size     = "20"
  image_id = var.os
}

resource "yandex_compute_disk" "disk-fin" {
  name     = "disk-fin"
  type     = "network-ssd"
  zone     = "ru-central1-d"
  size     = "20"
  image_id = var.os
}

resource "yandex_compute_instance" "vmmed" {
  name = "vm-med"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    disk_id = yandex_compute_disk.disk-med.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
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
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }
}

resource "yandex_compute_instance" "vmai" {
  name = "vm-ai"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    disk_id = yandex_compute_disk.disk-ai.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
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
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
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



