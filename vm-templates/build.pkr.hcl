source "vsphere-iso" "win-2022-std-core" {
  CPUs            = var.CPUs
  RAM             = var.RAM
  boot_command    = var.boot_command
  boot_order      = var.boot_order
  boot_wait       = var.boot_wait
  cluster         = var.vsphere_compute_cluster
  content_library_destination {
    destroy = var.library_vm_destroy
    library = var.content_library_destination
    name    = var.template_library_Name
    ovf     = var.ovf
  }
  datacenter           = var.vsphere_datacenter
  datastore            = var.vsphere_datastore
  disk_controller_type = var.disk_controller_type
  firmware             = var.firmware
  floppy_files         = var.config_files
  folder               = var.vsphere_folder
  guest_os_type        = var.guest_os_type
  http_directory       = var.http_directory
  http_port_min        = var.http_port_min
  http_port_max        = var.http_port_max
  http_ip              = "10.20.1.172"
  insecure_connection  = var.insecure_connection
  iso_paths            = [var.os_iso_path,var.vmtools_iso_path]
  remove_cdrom         = var.remove_cdrom
  network_adapters {
    network      = var.vsphere_portgroup_name
    network_card = var.network_card
  }
  notes        = "Built via Packer: - Repo ${var.build_repo}"
  password     = var.vsphere_password
  communicator = var.communicator
  winrm_insecure = var.winrm_insecure
  winrm_password = var.communicator_password
  winrm_timeout  = var.communicator_timeout
  winrm_username = var.communicator_user
  storage {
    disk_size             = var.disk_size
    disk_thin_provisioned = var.disk_thin_provisioned
  }
  username       = var.vsphere_user
  vcenter_server = var.vsphere_server
  vm_name        = var.vm_name
  vm_version     = var.vm_version
  shutdown_timeout = var.shutdown_timeout
  shutdown_command = "shutdown /s /t 10 /f /d p:4:1 /c \"Packer Complete\""
}

source "vsphere-iso" "win-2022-std-gui" {
  CPUs            = var.CPUs
  RAM             = var.RAM
  boot_command    = var.boot_command
  boot_order      = var.boot_order
  boot_wait       = var.boot_wait
  cluster         = var.vsphere_compute_cluster
  content_library_destination {
    destroy = var.library_vm_destroy
    library = var.content_library_destination
    name    = var.template_library_Name
    ovf     = var.ovf
  }
  datacenter           = var.vsphere_datacenter
  datastore            = var.vsphere_datastore
  disk_controller_type = var.disk_controller_type
  firmware             = var.firmware
  floppy_files         = var.config_files
  folder               = var.vsphere_folder
  guest_os_type        = var.guest_os_type
  http_directory       = var.http_directory
  http_port_min        = var.http_port_min
  http_port_max        = var.http_port_max
  http_ip              = "10.20.1.172"
  insecure_connection  = var.insecure_connection
  iso_paths            = [var.os_iso_path,var.vmtools_iso_path]
  remove_cdrom         = var.remove_cdrom
  network_adapters {

    network      = var.vsphere_portgroup_name
    network_card = var.network_card
  }
  notes        = "Built via Packer: - Repo ${var.build_repo}"
  password     = var.vsphere_password
  communicator = var.communicator
  winrm_insecure = var.winrm_insecure
  winrm_password = var.communicator_password
  winrm_timeout  = var.communicator_timeout
  winrm_username = var.communicator_user
  storage {
    disk_size             = var.disk_size
    disk_thin_provisioned = var.disk_thin_provisioned
  }
  username       = var.vsphere_user
  vcenter_server = var.vsphere_server
  vm_name        = var.vm_name
  vm_version     = var.vm_version
  shutdown_timeout = var.shutdown_timeout
  shutdown_command = "shutdown /s /t 10 /f /d p:4:1 /c \"Packer Complete\""
}
source "vsphere-iso" "photon-4" {
  CPUs            = var.CPUs
  RAM             = var.RAM
  boot_command    = [ "<esc><wait> vmlinuz initrd=initrd.img root=/dev/ram0 loglevel=3 insecure_installation=1 ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/${ var.http_file } photon.media=cdrom <enter>" ]
  boot_order      = var.boot_order
  boot_wait       = var.boot_wait
  cluster         = var.vsphere_compute_cluster
  content_library_destination {
    destroy = var.library_vm_destroy
    library = var.content_library_destination
    name    = var.template_library_Name
    ovf     = var.ovf
  }
  datacenter           = var.vsphere_datacenter
  datastore            = var.vsphere_datastore
  disk_controller_type = var.disk_controller_type
  firmware             = var.firmware
  folder               = var.vsphere_folder
  guest_os_type        = var.guest_os_type
  http_directory       = var.http_directory
  http_port_min        = var.http_port_min
  http_port_max        = var.http_port_max
  http_ip              = "10.20.1.172"
  insecure_connection  = var.insecure_connection
  iso_paths = [var.os_iso_path]
  remove_cdrom         = var.remove_cdrom
  network_adapters {
    network      = var.vsphere_portgroup_name
    network_card = var.network_card
  }
  notes        = "Built via Packer: - Repo ${var.build_repo}"
  password     = var.vsphere_password
  ssh_password = var.communicator_password
  ssh_timeout  = var.communicator_timeout
  ssh_username = var.communicator_user
  storage {
    disk_size             = var.disk_size
    disk_thin_provisioned = var.disk_thin_provisioned
  }
  username       = var.vsphere_user
  vcenter_server = var.vsphere_server
  vm_name        = var.vm_name
  vm_version     = var.vm_version
}
source "vsphere-iso" "rhel-8" {
  CPUs            = var.CPUs
  RAM             = var.RAM
  boot_command    = [ "<tab>", " text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/${var.http_file}",
                      "<enter><wait><wait><enter>" ]
  boot_order      = var.boot_order
  boot_wait       = var.boot_wait
  cluster         = var.vsphere_compute_cluster
  content_library_destination {
    destroy = var.library_vm_destroy
    library = var.content_library_destination
    name    = var.template_library_Name
    ovf     = var.ovf
  }
  datacenter           = var.vsphere_datacenter
  datastore            = var.vsphere_datastore
  disk_controller_type = var.disk_controller_type
  firmware             = var.firmware
  folder               = var.vsphere_folder
  guest_os_type        = var.guest_os_type
  http_directory       = var.http_directory
  http_port_min        = var.http_port_min
  http_port_max        = var.http_port_max
  http_ip              = "10.20.1.172"
  insecure_connection  = var.insecure_connection
  iso_paths = [var.os_iso_path]
  remove_cdrom         = var.remove_cdrom
  network_adapters {
    network      = var.vsphere_portgroup_name
    network_card = var.network_card
  }
  notes        = "Built via Packer: - Repo ${var.build_repo}"
  password     = var.vsphere_password
  ssh_password = var.communicator_password
  ssh_timeout  = var.communicator_timeout
  ssh_username = var.communicator_user
  storage {
    disk_size             = var.disk_size
    disk_thin_provisioned = var.disk_thin_provisioned
  }
  username       = var.vsphere_user
  vcenter_server = var.vsphere_server
  vm_name        = var.vm_name
  vm_version     = var.vm_version
}
build {
  sources = ["source.vsphere-iso.win-2022-std-core"]

  provisioner "powershell" {
    scripts           = var.script_files
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
    scripts           = var.cleanup
  }
}
build {
  sources = ["source.vsphere-iso.win-2022-std-gui"]

  provisioner "powershell" {
    scripts           = var.script_files
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
    scripts           = var.cleanup
  }
}
build {
  sources = ["source.vsphere-iso.photon-4"]

  provisioner "shell" {
    execute_command = "echo '${var.communicator_password}' | {{.Vars}} sudo -E -S sh -eu '{{.Path}}'"
    scripts         = var.script_files
  }
  provisioner "shell" {
    execute_command = "echo '${var.communicator_password}' | {{.Vars}} sudo -E -S sh -eu '{{.Path}}'"
    scripts         = var.config_files
  }
  provisioner "shell" {
    execute_command = "echo '${var.communicator_password}' | {{.Vars}} sudo -E -S sh -eu '{{.Path}}'"
    scripts         = var.cleanup
  }
}
build {
  sources = ["source.vsphere-iso.rhel-8"]

  provisioner "shell" {
    execute_command = "echo '${var.communicator_password}' | sudo -E -S sh -eu  '{{ .Path }}'"
    scripts         = var.script_files
  }
  provisioner "shell" {
    execute_command = "echo '${var.communicator_password}' | sudo -E -S sh -eu '{{ .Path }}'"
    scripts         = var.config_files
  }
  provisioner "shell" {
    execute_command = "echo '${var.communicator_password}' | sudo -E -S sh -eu '{{ .Path }}'"
    scripts         = var.cleanup
  }
}

