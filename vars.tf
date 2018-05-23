variable "qtd" {
  default = 1
}
## SET SSH USERNAME AND PASSWORD
variable "user" {
  default = "devops"
}

variable "password" {
  default = "12qwaszx"
}

## NETWORK CONFIGURATION START
## Enter the IP, DNS and GW or comment the "default" lines to get the network infos through a DHCP server.variable "ipv4_address" {
  default = "192.16.21.243"
}

variable "ipv4_netmask" {
  default = 23
}

variable "ipv4_gateway" {
  default = "192.16.20.1"
}

variable "dns_server_list" {
  type    = "list"
  default = ["192.16.20.10"]
}

variable "dns_suffix_list" {
  type    = "list"
  default = ["192.16.20.10"]
}
## NETWORK CONFIGURATION END

variable "client_name" {
  default = "jmaurotec"
}

variable "environment" {
  default = "dr"
}

variable "type" {
  default = "compute"
}

variable "hostname" {
  default = "VM_HOSTNAME"
}

variable "business_unit" {
  default = "VM_BU"
}

variable "cpu" {
  default = "VM_CPU"
}

variable "ram" {
  default = "VM_MEMORY"
}

variable "java_version" {
  default = "VM_JAVA_VERSION"
}

variable "product" {
  default = "VM_PRODUCT"
}

variable "domain" {
  default = "VM_DOMAIN"
}

variable "zone" {
  default = "VM_ZONE"
}

variable "country" {
  default = "VM_COUNTRY"
}

## VMWARE INFOS

variable "dc" {
  default = "VM_DC"
}

variable "datastore" {
  default = "VM_DATASTORE"
}

variable "pool" {
  default = "VM_POOL"
}

variable "network" {
  default = "VM_NETWORK"
}

variable "template" {
  default = "VM_TEMPLATE"
}