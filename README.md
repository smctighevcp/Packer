# Packer

 This repository contains packer builds for multiple operating systems using the vSphere-ISO builder.  These are my updated configurations using HCL rather than JSON following the release of Packer 1.7.

 There are individual builds which are referenced from my blog series (Link) and use some older techniques.  These are located in the OS specific folders.

 The vm-templates folder contains a combined configuration that uses some newer techniques with multiple improvements, as well as better reuse of the code, making it easier to maintain.  I currently has a template configuration for Windows Server 2022, Photon and RHEL.


## Files
- variables.pkr.hcl - Variable declaration file
- 'OS-Name'.pkr.hcl - Build file in each OS specific configuration
- build.pkr.hcl - Combined build file in new configuration
- 'OS-Name'.pkrvar.hcl - User Defined variables file
- packer-build-menu.ps1 - Interactive PowerShell menu to build your templates from the combined build.
- get-application-media.ps1 - Used to create a ZIP file of install media to then be intalled via the package-installations.ps1 script during the build.



## Usage

### Individual Build

Example build command for a Windows 2019 Core Template

*Note the '.' at the end.  This isnt a typo!  This tells Packer to process all the configuration files in the current directory.  This allows you to separate out your config to make it easier to manage and reuse.*

```
$ packer build -var-file="win2019core.pkrvar.hcl" .
```

### Packer Build Menu

```
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

## Change Log
### 08/01/2022
* Added an improved combind build (vm-templates).
* Windows Server Core and Deskop Expirence template builds added (via combined vm-templates configuration).
* vm-templates - now loads PVSCSI Drivers via the mounted VMTools media for Windows Builds.
* vm-templates - Reduced repeat files and code.
* vm-templates - Improved and more consistent script files in configuration.