// variables.pkr.hcl
variable "vsphere_server" {
  type    = string
  default = "vm-vcsa-01.smt-lab.local"
  description = "vCenter Server"
}
variable "vsphere_user" {
  type      = string
  default   = "stephan@smt-lab.local"
  sensitive = true
}
variable "vsphere_password" {}
variable "insecure_connection" {
  type    = bool
  default = true
}
variable "vsphere_folder" {
  type    = string
  default = "Templates"
}
variable "vsphere_datacenter" {
  type    = string
  default = "dc-smt-01"
}
variable "vsphere_compute_cluster" {
  type    = string
  default = "cl-vsan-01"
}
variable "vsphere_portgroup_name" {
  type    = string
  default = "dvPG_Demo_DHCP_149"
}
variable "vsphere_datastore" {
  type    = string
  default = "ds-vsan-01"
}

variable "content_library_destination" {
  type    = string
  default = "Images"
}
variable "template_library_Name" {
  type = string
}
variable "library_vm_destroy" {
  type    = bool
  default = true
}
variable "ovf" {
  type    = bool
  default = true
}
variable "vm_name" {}
variable "CPUs" {}
variable "RAM" {}
variable "disk_size" {}
variable "ram_reserve_all" {
  type    = bool
  default = true
}
variable "firmware" {}
variable "vm_version" {
  type    = string
  default = "17"
}
variable "notes" {
  type    = string
  default = "Built with Packer"
}
variable "guest_os_type" {}
variable "boot_order" {
  type    = string
  default = "disk,cdrom"
}
variable "communicator" {}
variable "ip_wait_timeout"{
  type    = string
  default = "1h"
}
variable "connection_username" {}
variable "connection_password" {}
variable "communicator_timeout" {}
variable "disk_controller_type" {}
variable "disk_thin_provisioned" {
  type    = bool
  default = true
}
variable "network_card" {
  type    = string
  default = "vmxnet3"
}

variable "os_iso_path" {}
variable "vmtools_iso_path" {}
variable "boot_wait" {}
variable "boot_command" {}
variable "config_files" {}
variable "script_files" {}