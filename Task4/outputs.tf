output "internal_ip_address_vm_med" {
  value = yandex_compute_instance.vmmed.network_interface.0.ip_address
}

output "internal_ip_address_vm_admin" {
  value = yandex_compute_instance.vmadmin.network_interface.0.ip_address
}

output "internal_ip_address_vm_ai" {
  value = yandex_compute_instance.vmai.network_interface.0.ip_address
}

output "internal_ip_address_vm_fin" {
  value = yandex_compute_instance.vmfin.network_interface.0.ip_address
}

output "external_ip_address_vm_med" {
  value = yandex_compute_instance.vmmed.network_interface.0.nat_ip_address
}

output "external_ip_address_vm_admin" {
  value = yandex_compute_instance.vmadmin.network_interface.0.nat_ip_address
}

output "external_ip_address_vm_ai" {
  value = yandex_compute_instance.vmai.network_interface.0.nat_ip_address
}

output "external_ip_address_vm_fin" {
  value = yandex_compute_instance.vmfin.network_interface.0.nat_ip_address
}


