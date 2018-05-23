resource "vsphere_virtual_machine" "vm" {
  count            = "${var.qtd}"
  name             = "${var.business_unit}-${var.hostname}"
  num_cpus         = "${var.cpu}"
  memory           = "${var.ram}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  guest_id         = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type        = "${data.vsphere_virtual_machine.template.scsi_type}"

  network_interface {
    network_id       = "${data.vsphere_network.network.id}"
    adapter_type     = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "${var.business_unit}-${var.hostname}-${count.index + 1}"
        domain    = "${var.domain}"
      }

      network_interface {
        ipv4_address  = "${var.ipv4_address}"
        ipv4_netmask  = "${var.ipv4_netmask}"
      }

      ipv4_gateway    = "${var.ipv4_gateway}"
      dns_server_list = "${var.dns_server_list}"
      dns_suffix_list = "${var.dns_suffix_list}"
    }
  }

  connection {
    type      = "ssh"
    user      = "${var.user}"
    password  = "${var.password}"
  }

  provisioner "remote-exec" {
     inline = [
       "sudo /usr/bin/hostnamectl set-hostname ${var.hostname}.${var.type}.${var.country}.${var.zone}.${var.domain}",
     ]
   }
}
## ansible execute
# resource "null_resource" "vm" {
#  provisioner "local-exec" {
#    command = "echo ${vsphere_virtual_machine.vm.0.guest_ip_addresses.0} ansible_user=${var.user} ansible_password=${var.password} > hosts; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts ../../ansible/main.yml --extra-vars 'java_version=${var.java_version} produto=${var.product}'"
#  }
#}