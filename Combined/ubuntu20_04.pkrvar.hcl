//Defined User Variables
template_library_Name   = "ubu_20_04"
vm_name                 = "ubuntu20_04"
CPUs                    = "1"
RAM                     = "2048"
disk_size               = "25600"
firmware                = "bios"
guest_os_type           = "ubuntu64Guest"
communicator_timeout    = "30m"
communicator            = "ssh"
disk_controller_type    = ["pvscsi"]
os_iso_path             = "[ds-vsan-01] /Media/ubuntu-20.04.1-legacy-server-amd64.iso"
vmtools_iso_path        = "[ds-vsan-01] /Media/VMTools/linux.iso"
boot_wait               = "12s"
boot_command            = [
                            "<wait><wait><enter><wait><esc><wait><enter>",
                            "/install/vmlinuz",
                            " initrd=/install/initrd.gz<wait>",
                            " auto-install/enable=true",
                            " debconf/priority=critical",
                            " url=http://smt-lab-http-01.smt-lab.local:80/boot_files/ubuntu2004/preseed.cfg",
                            " -- <wait>",
                            "<enter><wait>"
                        ]
config_files            = []
script_files            = ["scripts/linux/ubuntu/update.sh"]