// Installation Operating System Metadata
vm_inst_os_language                 = "en-US"
vm_inst_os_keyboard                 = "en-GB"
vm_inst_os_image_standard_core      = "Windows Server 2019 SERVERSTANDARDCORE"
vm_inst_os_image_standard_desktop   = "Windows Server 2019 SERVERSTANDARD"
vm_inst_os_kms_key_standard         = "N69G4-B89J2-4G8F4-WWYCC-J464C"
vm_inst_os_image_datacenter_core    = "Windows Server 2019 SERVERDATACENTERCORE"
vm_inst_os_image_datacenter_desktop = "Windows Server 2019 SERVERDATACENTER"
vm_inst_os_kms_key_datacenter       = "WMDGN-G9PQG-XVVXX-R3X43-63DFG"

// Guest Operating System Metadata
vm_guest_os_language           = "en-US"
vm_guest_os_keyboard           = "en-GB"
vm_guest_os_timezone           = "GMT Standard Time"
vm_guest_os_family             = "windows"
vm_guest_os_name               = "server"
vm_guest_os_version            = "2019"
vm_guest_os_edition_standard   = "standard"
vm_guest_os_edition_datacenter = "datacenter"
vm_guest_os_experience_core    = "core"
vm_guest_os_experience_desktop = "dexp"
vm_guest_os_type               = "windows2019srvNext_64Guest"

//Media Settings
vm_inst_os_iso_path             = "[ds-vmfs-01] /Media/windows_server_2019.iso"
vm_inst_vmtools_iso_path        = "[ds-vmfs-01] /Media/VMTools/windows.iso"
vm_inst_script_files            = ["scripts/windows/os-configuration.ps1"]
vm_inst_cleanup                 = ["scripts/windows/cleanup.ps1"]
