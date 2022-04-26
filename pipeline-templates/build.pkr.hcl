packer {
  required_version = ">= 1.7.0"
  required_plugins {
    vsphere = {
      version = ">= v1.0.3"
      source  = "github.com/hashicorp/vsphere"
    }
  }
  required_plugins {
    windows-update = {
      version = ">= 0.14.0"
      source  = "github.com/rgl/windows-update"
    }
  }
}

source "vsphere-iso" "win-2022-std-core" {

  // vCenter Server Settings and Credentials
    vcenter_server = var.default_vsphere_server
    username       = var.env_vsphere_username
    password     = var.env_vsphere_password
    insecure_connection  = var.default_insecure_connection

  // vSphere Settings
  cluster         = var.default_vsphere_compute_cluster
  datacenter           = var.default_vsphere_datacenter
  datastore            = var.default_vsphere_datastore
  folder               = var.default_vsphere_folder

  // VM Settings
  vm_name        = "${var.vm_guest_os_family}-${var.vm_guest_os_name}-${var.vm_guest_os_version}-${var.vm_guest_os_edition_standard}-${var.vm_guest_os_experience_core}"
  CPUs            = var.default_CPUs
  RAM             = var.default_RAM
  firmware             = var.default_firmware
  vm_version     = var.default_vm_version
  guest_os_type        = var.vm_guest_os_type
  network_adapters {
    network      = var.default_vsphere_portgroup_name
    network_card = var.default_network_card
  }
  disk_controller_type = var.default_disk_controller_type
  storage {
    disk_size             = var.default_disk_size
    disk_thin_provisioned = var.default_disk_thin_provisioned
  }
  remove_cdrom         = var.default_remove_cdrom

  // Boot & Shutdown Settings
  boot_command    = var.default_boot_command
  boot_order      = var.default_boot_order
  boot_wait       = var.default_boot_wait
  shutdown_timeout = var.default_shutdown_timeout
  shutdown_command = var.default_shutdown_command

  // Media Settings
  iso_paths            = [var.vm_inst_os_iso_path,var.vm_inst_vmtools_iso_path]
  floppy_files         = ["${path.cwd}/scripts/${var.vm_guest_os_family}/initial-configuration.ps1"
  ]
  floppy_content = {
    "autounattend.xml" = templatefile("${abspath(path.root)}/config/windows/autounattend.pkrtpl.hcl", {
      env_communicator_username       = var.env_communicator_username
      env_communicator_password       = var.env_communicator_password
      vm_inst_os_language         = var.vm_inst_os_language
      vm_inst_os_keyboard         = var.vm_inst_os_keyboard
      vm_inst_os_image            = var.vm_inst_os_image_standard_core
      vm_inst_os_kms_key          = var.vm_inst_os_kms_key_standard
      vm_guest_os_language        = var.vm_guest_os_language
      vm_guest_os_keyboard        = var.vm_guest_os_keyboard
      vm_guest_os_timezone        = var.vm_guest_os_timezone
    })
  }

  // Communicator Settings
  communicator = var.default_communicator
  winrm_insecure = var.default_winrm_insecure
  winrm_username = var.env_communicator_username
  winrm_password = var.env_communicator_password
  winrm_timeout  = var.default_communicator_timeout

  // Content Library Settings
    content_library_destination {
    name    = "${var.vm_guest_os_family}-${var.vm_guest_os_name}-${var.vm_guest_os_version}-${var.vm_guest_os_edition_standard}-${var.vm_guest_os_experience_core}"
    library = var.default_content_library_destination
    destroy = var.default_library_vm_destroy
    ovf     = var.default_ovf
  }
}
source "vsphere-iso" "win-2022-std-dexp" {

  // vCenter Server Settings and Credentials
    vcenter_server = var.default_vsphere_server
    username       = var.env_vsphere_username
    password     = var.env_vsphere_password
    insecure_connection  = var.default_insecure_connection

  // vSphere Settings
  cluster         = var.default_vsphere_compute_cluster
  datacenter           = var.default_vsphere_datacenter
  datastore            = var.default_vsphere_datastore
  folder               = var.default_vsphere_folder

  // VM Settings
  vm_name        = "${var.vm_guest_os_family}-${var.vm_guest_os_name}-${var.vm_guest_os_version}-${var.vm_guest_os_edition_standard}-${var.vm_guest_os_experience_desktop}"
  CPUs            = var.default_CPUs
  RAM             = var.default_RAM
  firmware             = var.default_firmware
  vm_version     = var.default_vm_version
  guest_os_type        = var.vm_guest_os_type
  network_adapters {
    network      = var.default_vsphere_portgroup_name
    network_card = var.default_network_card
  }
  disk_controller_type = var.default_disk_controller_type
  storage {
    disk_size             = var.default_disk_size
    disk_thin_provisioned = var.default_disk_thin_provisioned
  }
  remove_cdrom         = var.default_remove_cdrom

  // Boot & Shutdown Settings
  boot_command    = var.default_boot_command
  boot_order      = var.default_boot_order
  boot_wait       = var.default_boot_wait
  shutdown_timeout = var.default_shutdown_timeout
  shutdown_command = var.default_shutdown_command

  // Media Settings
  iso_paths            = [var.vm_inst_os_iso_path,var.vm_inst_vmtools_iso_path]
  floppy_files         = ["${path.cwd}/scripts/${var.vm_guest_os_family}/initial-configuration.ps1"
  ]
  floppy_content = {
    "autounattend.xml" = templatefile("${abspath(path.root)}/config/windows/autounattend.pkrtpl.hcl", {
      env_communicator_username       = var.env_communicator_username
      env_communicator_password       = var.env_communicator_password
      vm_inst_os_language         = var.vm_inst_os_language
      vm_inst_os_keyboard         = var.vm_inst_os_keyboard
      vm_inst_os_image            = var.vm_inst_os_image_standard_desktop
      vm_inst_os_kms_key          = var.vm_inst_os_kms_key_standard
      vm_guest_os_language        = var.vm_guest_os_language
      vm_guest_os_keyboard        = var.vm_guest_os_keyboard
      vm_guest_os_timezone        = var.vm_guest_os_timezone
    })
  }

  // Communicator Settings
  communicator = var.default_communicator
  winrm_insecure = var.default_winrm_insecure
  winrm_username = var.env_communicator_username
  winrm_password = var.env_communicator_password
  winrm_timeout  = var.default_communicator_timeout

  // Content Library Settings
    content_library_destination {
    name    = "${var.vm_guest_os_family}-${var.vm_guest_os_name}-${var.vm_guest_os_version}-${var.vm_guest_os_edition_standard}-${var.vm_guest_os_experience_desktop}"
    library = var.default_content_library_destination
    destroy = var.default_library_vm_destroy
    ovf     = var.default_ovf
  }
}
build {
  sources = ["source.vsphere-iso.win-2022-std-core"]

  provisioner "powershell" {
    scripts           = var.vm_inst_script_files
  }
  provisioner "windows-update" {
            search_criteria = "IsInstalled=0"
            filters = [
                      "exclude:$_.Title -like '*Preview*'",
                      "exclude:$_.Title -like '*VMware*'",
                      "exclude:$_.InstallationBehavior.CanRequestUserInput",
                      "exclude:$_.Title -like '*Defender*'",
                      "include:$true"
            ]
            update_limit = 25
            restart_timeout     = "120m"
  }
    provisioner "powershell" {
    scripts           = var.vm_inst_cleanup
  }
}
build {
  sources = ["source.vsphere-iso.win-2022-std-dexp"]

  provisioner "powershell" {
    scripts           = var.vm_inst_script_files
  }
  provisioner "windows-update" {
            search_criteria = "IsInstalled=0"
            filters = [
                      "exclude:$_.Title -like '*Preview*'",
                      "exclude:$_.Title -like '*VMware*'",
                      "exclude:$_.InstallationBehavior.CanRequestUserInput",
                      "exclude:$_.Title -like '*Defender*'",
                      "include:$true"
            ]
            update_limit = 25
            restart_timeout     = "120m"
  }
    provisioner "powershell" {
    scripts           = var.vm_inst_cleanup
  }
}
