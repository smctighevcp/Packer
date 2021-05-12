//Defined User Variables
template_library_Name   = "win-2019-std-core"
vm_name                 = "windows-2019-std-core"
CPUs                    = "2"
RAM                     = "2048"
disk_size               = "61440"
firmware                = "efi"
guest_os_type           = "windows2019srv_64Guest"
communicator            = "winrm"
communicator_timeout    = "30m"
disk_controller_type    = ["pvscsi"]
os_iso_path             = "[ds-vsan-01] /Media/windows_server_2019.iso"
vmtools_iso_path        = "[ds-vsan-01] /Media/VMTools/windows.iso"
boot_wait               = "3s"
boot_command            = ["<spacebar>"]
config_files            = ["config/win-core/autounattend.xml","scripts/windows/pvscsi","scripts/windows/install-vm-tools.cmd","scripts/windows/enable-winrm.ps1","scripts/windows/psrepo_nuget.ps1","scripts/windows/install-psmodules.ps1"]
script_files            = ["scripts/windows/enable-rdp.cmd", "scripts/windows/disable-tls.ps1"]