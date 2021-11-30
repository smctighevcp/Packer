//Defined User Variables
vsphere_password        = "VMware123!"
template_library_Name   = "win-2022-std-gui"
vm_name                 = "windows-2022-std-gui"
guest_os_type           = "windows2019srvNext_64Guest"
communicator_user       = "administrator"
communicator_password   = "VMware123!"
os_iso_path             = "[ds-vmfs-01] /Media/windows_server_2022.iso"
vmtools_iso_path        = "[ds-vmfs-01] /Media/VMTools/windows.iso"
config_files            = ["config/win-2022-gui/autounattend.xml","scripts/windows/initial-configuration.ps1"]
script_files            = ["scripts/windows/os-configuration.ps1"]
cleanup                 = ["scripts/windows/cleanup.ps1"]