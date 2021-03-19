# Packer

## Windows Server 2019 Core

 This repository contains a Packer build for Windows Server 2019 using the vSphere-ISO builder.
 These are my updated configurations using HCL rather than JSON following the release of Packer 1.7.

## Structure
- ->config
	- ->autounattend.xml
 - ->output
 - ->scripts
	- ->pvscsi
		- ->pcscsi.cat
		- ->pcscsi.inf
		- ->pcscsi.sys
		- ->txtsetup.oem
	- ->disable-tls.ps1
	- ->enable-rdp.cmd
	- ->enable-winrm.ps1
	- ->install_VM_Tools.cmd
 - ->variables.pkr.hcl
 - ->win2019core.pkr.hcl
 - ->win2019core.pkrvar.hcl

## Files
- variables.pkr.hcl - Variable declaration file
- win2019core.pkr.hcl - Build file
- win2019core.pkrvar.hcl - User Defined variables file

## Environmental Variables
In order to not record sensitive variables in the confguration files, you can make use of environmental variables (This configuration uses user defined variables, see the consolidated configuration for environmental usage).

## Usage

*Note the '.' at the end.  This isnt a typo!  This tells Packer to process all the configuration files in the current directory.  This allows you to separate out your config to make it easier to manage and reuse.*

```
$ packer build -var-file="win2019core.pkrvar.hcl" .
```