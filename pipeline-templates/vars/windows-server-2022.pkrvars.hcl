// Installation Operating System Metadata
vm_inst_os_language                 = "en-US"
vm_inst_os_keyboard                 = "en-GB"
vm_inst_os_image_standard_core      = "Windows Server 2022 SERVERSTANDARDCORE"
vm_inst_os_image_standard_desktop   = "Windows Server 2022 SERVERSTANDARD"
vm_inst_os_kms_key_standard         = "VDYBN-27WPP-V4HQT-9VMD4-VMK7H"
vm_inst_os_image_datacenter_core    = "Windows Server 2022 SERVERDATACENTERCORE"
vm_inst_os_image_datacenter_desktop = "Windows Server 2022 SERVERDATACENTER"
vm_inst_os_kms_key_datacenter       = "WX4NM-KYWYW-QJJR4-XV3QB-6VM33"

// Guest Operating System Metadata
vm_guest_os_language           = "en-US"
vm_guest_os_keyboard           = "en-GB"
vm_guest_os_timezone           = "GMT Standard Time"
vm_guest_os_family             = "windows"
vm_guest_os_name               = "server"
vm_guest_os_version            = "2022"
vm_guest_os_edition_standard   = "standard"
vm_guest_os_edition_datacenter = "datacenter"
vm_guest_os_experience_core    = "core"
vm_guest_os_experience_desktop = "dexp"
vm_guest_os_type               = "windows2019srvNext_64Guest"

//Media Settings
vm_inst_os_iso_path             = "[ds-vmfs-01] /Media/windows_server_2022.iso"
vm_inst_vmtools_iso_path        = "[ds-vmfs-01] /Media/VMTools/windows.iso"
vm_inst_script_files            = ["scripts/windows/os-configuration.ps1"]
vm_inst_cleanup                 = ["scripts/windows/cleanup.ps1"]
