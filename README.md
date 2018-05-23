# terraform-vmware
This script will create a new VM from a base image on VMWare using terraform
The CLI is designed to be a user friendly CLI alternative to the GUI and well suited for automation tasks.

## Pre-requirements

Download and install terraform

[Terraform] https://www.terraform.io/downloads.html

### Usage

Change the variables within the vars.tf file according to your environment

Change the your VMWare credentials within the credentials.tf 

``` 
provider "vsphere" {
    user          = "USERNAME"
    password      = "PASSWORD"
    vsphere_server    = "VCENTER HOST"
    allow_unverified_ssl = true
}
```

And finally run the ```terraform plan``` to get an overview of what will be done in VMWAre and ```terraform apply``` to start the server creation
