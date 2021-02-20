//Defined User Variables
template_library_Name   = "cen-7"
vm_name                 = "centos7"
CPUs                    = "1"
RAM                     = "2048"
disk_size               = "25600"
firmware                = "bios"
vm_version              = "17"
notes                   = "Built via Packer"
guest_os_type           = "centos7_64Guest"
ip_wait_timeout         = "1h"
communicator            = "ssh"
ssh_timeout             = "30m"
disk_controller_type    = ["pvscsi"]
os_iso_path             = "[smt-lab-ds-vsan-01] /Media/CentOS-7-x86_64-DVD-2009.iso"
vmtools_iso_path        = "[smt-lab-ds-vsan-01] /Media/VMTools/linux.iso"
boot_wait               = "15s"
boot_command            = ["<up><wait><tab><wait> ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/centos7-ks.cfg <enter><wait>"]
config_files            = ["config/ks.cfg"]
script_files            = ["scripts/install-vmtools.sh","scripts/update.sh"]