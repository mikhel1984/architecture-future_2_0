output "internal_ip_address_vm_med" {
  value = yandex_compute_instance.vm-med.network_interface.0.ip_address
}

output "internal_ip_address_vm_admin" {
  value = yandex_compute_instance.vm-admin.network_interface.0.ip_address
}

output "internal_ip_address_vm_ai" {
  value = yandex_compute_instance.vm-ai.network_interface.0.ip_address
}

output "internal_ip_address_vm_fin" {
  value = yandex_compute_instance.vm-fin.network_interface.0.ip_address
}

output "external_ip_address_vm_med" {
  value = yandex_compute_instance.vm-med.network_interface.0.nat_ip_address
}

output "external_ip_address_vm_admin" {
  value = yandex_compute_instance.vm-admin.network_interface.0.nat_ip_address
}

output "external_ip_address_vm_ai" {
  value = yandex_compute_instance.vm-ai.network_interface.0.nat_ip_address
}

output "external_ip_address_vm_fin" {
  value = yandex_compute_instance.vm-fin.network_interface.0.nat_ip_address
}

