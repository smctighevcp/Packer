//Defined User Variables
vsphere_datacenter      = "dc-smt-01"
vsphere_password        = "VMware123!"
vsphere_compute_cluster = "cl-vsan-01"
vsphere_portgroup_name  = "dvPG_Demo_DHCP_149"
vsphere_datastore       = "ds-vsan-01"
template_library_Name   = "cen-7"
vm_name                 = "centos7"
CPUs                    = "1"
RAM                     = "2048"
disk_size               = "25600"
firmware                = "bios"
vm_version              = "17"
notes                   = "Built via Packer with user defined variables"
guest_os_type           = "centos7_64Guest"
ssh_username            = "linux_user"
ssh_password            = "VMware123!"
ssh_timeout             = "30m"
disk_controller_type    = ["pvscsi"]
os_iso_path             = "[ds-vsan-01] /Media/CentOS-7-x86_64-DVD-2009.iso"
vmtools_iso_path        = "[ds-vsan-01] /Media/VMTools/linux.iso"
boot_wait               = "15s"
boot_command            = ["<up><wait><tab><wait> inst.text inst.ks=hd:fd0:/ks.cfg <enter><wait>"]
config_files            = ["config/ks.cfg"]
script_files            = ["scripts/install-vmtools.sh","scripts/update.sh"]