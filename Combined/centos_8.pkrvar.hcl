//Defined User Variables
template_library_Name   = "cen-8"
vm_name                 = "centos8"
CPUs                    = "1"
RAM                     = "2048"
disk_size               = "25600"
firmware                = "bios"
guest_os_type           = "centos8_64Guest"
communicator_timeout    = "30m"
communicator            = "ssh"
disk_controller_type    = ["pvscsi"]
os_iso_path             = "[ds-vsan-01] /Media/CentOS-8.3.2011-x86_64-dvd1.iso"
vmtools_iso_path        = "[ds-vsan-01] /Media/VMTools/linux.iso"
boot_wait               = "15s"
boot_command            = ["<up><wait><tab><wait> text ks=http://smt-lab-http-01.smt-lab.local:80/boot_files/centos8/ks.cfg<enter><wait>"]
config_files            = []
script_files            = ["scripts/linux/centos8/install-vmtools.sh","scripts/linux/centos8/update.sh"]