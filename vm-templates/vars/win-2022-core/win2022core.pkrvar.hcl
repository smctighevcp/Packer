//Defined User Variables
template_library_Name   = "win-2022-std-core"
vm_name                 = "windows-2022-std-core"
guest_os_type           = "windows2019srvNext_64Guest"
communicator_user       = "administrator"
os_iso_path             = "[ds-vmfs-01] /Media/windows_server_2022.iso"
vmtools_iso_path        = "[ds-vmfs-01] /Media/VMTools/windows.iso"
config_files            = ["config/win-2022-core/autounattend.xml","scripts/windows/initial-configuration.ps1"]
script_files            = ["scripts/windows/os-configuration.ps1"]
cleanup                 = ["scripts/windows/cleanup.ps1"]