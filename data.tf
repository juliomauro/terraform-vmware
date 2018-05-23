# SET DATACENTER
data "vsphere_datacenter" "dc" {
  name = "${var.dc}"
}

# SET DATASTORE HD
data "vsphere_datastore" "datastore" {
  name          = "${var.datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

#SET POOL
data "vsphere_resource_pool" "pool" {
  name          = "${var.pool}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

# SET NETWORK
data "vsphere_network" "network" {
   name          = "${var.network}"
   datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

# SET TEMPLATE SOURCE NAME
data "vsphere_virtual_machine" "template" {
  name          = "${var.template}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}