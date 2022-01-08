//Defined User Variables
template_library_Name   = "lin-pho-4"
vm_name                 = "lin-pho-4"
CPUs                    = "1"
RAM                     = "1024"
disk_size               = "25600"
firmware                = "bios"
guest_os_type           = "vmwarePhoton64Guest"
communicator_user       = "root"
os_iso_path             = "[ds-vmfs-01] /Media/photon-4.iso"
vmtools_iso_path        = "[ds-vmfs-01] /Media/VMTools/linux.iso"
boot_wait               = "15s"
http_directory          = "config\\lin-pho-4"
http_file               = "photon-4.json"
script_files            = ["scripts/linux/initial-configuration.sh"]
config_files            = ["scripts/linux/os-configuration.sh"]
cleanup                 = ["scripts/linux/cleanup.sh"]