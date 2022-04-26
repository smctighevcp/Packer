<img src="https://github.com/smctighevcp/Packer/blob/main/packer-icon.svg" style="width:100px;height:100px;">

# Packer
## vm-templates
 The vm-templates folder contains a combined configuration that uses some newer techniques with multiple improvements, as well as better reuse of the code, making it easier to maintain.  It currently has a template configuration for Windows Server 2022, Photon and RHEL.

## Structure

```console
├── config
│   ├── lin-pho-4
|   |   └── photon-4.json
│   ├── lin-rhel-8.5
|   |   └── rhel.cfg
│   ├── win-2022-core
|   |   └── autounattend.xml
│   ├── win-2022-gui
|   |   └── autounattend.xml
├── scripts
│   ├── linux
|   |   └── lin-rhel-8.5
|   |   |   └── cleanup.sh
|   |   |   └── initial-configuration.sh
|   |   |   └── os-configuration.sh
|   |   └── cleanup.sh
|   |   └── initial-configuration.sh
|   |   └── os-configuration.sh
│   ├── windows
|   |   └── cleanup.ps1
|   |   └── initial-configuration.ps1
|   |   └── os-configuration.ps1
|   |   └── package-installations.ps1
├── vars
│   ├── lin-pho-4
|   |   └── photon_4.pkrvar.hcl
│   ├── lin-rhel-8.5
|   |   └── rhel-8.5.pkrvar.hcl
│   ├── win-2022-core
|   |   └── win2022core.pkrvar.hcl
│   ├── win-2022-gui
|   |   └── win2022gui.pkrvar.hcl
├── build.pkr.hcl
├── variables.pkr.hcl
├── paker-build-menu.ps1
```

## Files
- `variables.pkr.hcl` - Variable declaration file
- `build.pkr.hcl` - Build file in new configuration
- `'OS-Name'.pkrvar.hcl` - User Defined variables file
- `packer-build-menu.ps1` - Interactive PowerShell menu to build your templates from the combined build.

## Environmental Variables
In the 'vm-templates' build, I make use of the Export-Clixml and Import-Clixml commandlets, to store passwords in encrypted formats, and environment variables to consume them.  This is a more real world approach.

The following lines are present in the build menu script to show you an example.

```console
#Get encrypted credentials
$Credentialnonlocal = Import-Clixml "<Path>\admin.vsphere.local.secure"
$Credentiallocal = Import-Clixml "<Path>\local-os\local.admin.secure"

#Create Packer environment variables
$env:PKR_VAR_vsphere_password = $Credentialnonlocal.GetNetworkCredential().Password
$env:PKR_VAR_communicator_password = $Credentiallocal.GetNetworkCredential().Password
```

## Usage

```console
# .\packer-build-menu.ps1

8eee8            8eeee8                            8   8                            8eeee8
  8  e   e eeee  8      eeeeeee eeeee e     e      8   8 e   e eeeeeee eeeee eeeee  8    " e     eeeee e   e eeeee
  8e 8   8 8     8eeeee 8  8  8 8   8 8     8      8eee8 8   8 8  8  8 8   8 8   8  8e     8     8  88 8   8 8   8
  88 8eee8 8eee      88 8e 8  8 8eee8 8e    8e     88  8 8e  8 8e 8  8 8eee8 8e  8  88     8e    8   8 8e  8 8e  8
  88 88  8 88    e   88 88 8  8 88  8 88    88     88  8 88  8 88 8  8 88  8 88  8  88   e 88    8   8 88  8 88  8
  88 88  8 88ee  8eee88 88 8  8 88  8 88eee 88eee  88  8 88ee8 88 8  8 88  8 88  8  88eee8 88eee 8eee8 88ee8 88ee8

================ Select a HashiCorp Packer build for VMware vSphere: ================
1: Windows Server 2022 Standard - Desktop Experience
2: Windows Server 2022 Standard - Core
3: VMware Photon OS 4
4: Red Hat Enterprise Linux 8
Q: Quit
Please make a selection:

```

## Things to Replace

- `autounattended.xml` : ProductKey - VDYBN-27WPP-V4HQT-9VMD4-VMK7H (KMS Client Key) - If you are not using a KMS to licence your OS, change this as appropriate.
- `autounattended.xml` : FullName - Change as required.
- `autounattended.xml` : Organisation - Change as required.
- `autounattended.xml` : AdministratorPassword - Change as required, currently a generic value in plain text.
- `photon-4.json` : Passwords (including in the post install section) - Change as required, currently a generic value in plain text.
- `rhel.cfg` : Passwords ()rootpw and user) - Change as required, currently a generic value in plain text.
- `os-configuration.sh` : Change the logon banner to suit.
- `variables.pkr.hcl` : Multiple - Change all default values as required.


