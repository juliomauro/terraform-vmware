output "vmware_tools_status" {
  value = "${vsphere_virtual_machine.vm.*.vmware_tools_status}"
}

output "guest_ip_addresses" {
  value = "${vsphere_virtual_machine.vm.*.guest_ip_addresses}"
}

output "moid" {
  value = "${vsphere_virtual_machine.vm.*.moid}"
}