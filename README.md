# <img src="https://github.com/smctighevcp/Packer/blob/main/packer-icon.svg" style="width:50px;height:50px;"> Packer

 This repository contains packer builds for multiple operating systems using the vSphere-ISO builder.  These are my updated configurations using HCL rather than JSON following the release of Packer 1.7.

 There are individual builds which are referenced from my blog series [Link](https://stephanmctighe.com/2021/06/15/getting-started-with-packer-to-create-vsphere-templates-part-1/) and use some older techniques.  These are located in the OS specific folders.

 The vm-templates folder contains a combined configuration that uses some newer techniques with multiple improvements, as well as better reuse of the code, making it easier to maintain.  It currently has a template configuration for Windows Server 2022 (Core & Desktop), Photon and RHEL.


## Files
- variables.pkr.hcl - Variable declaration file
- 'OS-Name'.pkr.hcl - Build file in each OS specific configuration
- build.pkr.hcl - Combined build file in new configuration
- 'OS-Name'.pkrvar.hcl - User Defined variables file
- packer-build-menu.ps1 - Interactive PowerShell menu to build your templates from the combined build.
- get-application-media.ps1 - Used to create a ZIP file of install media to then be intalled via the package-installations.ps1 script during the build.

## Change Log
### 08/01/2022
* Added an improved combined build (vm-templates).
* Windows Server Core and Deskop Expirence template builds added (via combined vm-templates configuration).
* vm-templates - now loads PVSCSI Drivers via the mounted VMTools media for Windows Builds.
* vm-templates - Reduced repeat files and code.
* vm-templates - Improved and more consistent script files in configuration.
