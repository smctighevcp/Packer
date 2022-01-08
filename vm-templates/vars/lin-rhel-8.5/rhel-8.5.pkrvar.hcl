//Defined User Variables
template_library_Name   = "lin-rhel-8"
vm_name                 = "lin-rhel-8"
CPUs                    = "2"
RAM                     = "2048"
disk_size               = "25600"
firmware                = "bios"
guest_os_type           = "rhel8_64Guest"
communicator_user       = "root"
os_iso_path             = "[ds-vmfs-01] /Media/rhel-8.5.iso"
vmtools_iso_path        = "[ds-vmfs-01] /Media/VMTools/linux.iso"
boot_wait               = "10s"
http_directory          = "config\\lin-rhel-8.5"
http_file               = "rhel.cfg"
script_files            = ["scripts/linux/initial-configuration.sh"]
config_files            = ["scripts/linux/os-configuration.sh"]
cleanup                 = ["scripts/linux/cleanup.sh"]