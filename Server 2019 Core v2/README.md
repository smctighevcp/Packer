# Packer

## Windows Server 2019 Core v2

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
	- ->os-configuration.ps1
	- ->package-installations.ps1
 - ->variables.pkr.hcl
 - ->win2019core.pkr.hcl
 - ->win2019core.pkrvar.hcl

## Files
- variables.pkr.hcl - Variable declaration file
- win2019core.pkr.hcl - Build file
- win2019core.pkrvar.hcl - User Defined variables file

## Environmental Variables
In order to not record sensitive variables in the confguration files, you can make use of environmental variables.  This configuration uses user defined variables to help visualise what is happening.

Should you want to make use of environment variables for use via a workflow or pipeline or to avoid hardcoding password, you can set the variables in the PowerShell session or Shell session before running the build command.  To achieve this, on a windows machine, add each variable you wish to set like the examples below.

Note the PKR_VAR prefix.  Packer looks for any variables in the session with this prefix and uses them. You dont need to add this prefix in your config when declaring or referencing the variable.
```
$env:PKR_VAR_vsphere_user          = "<username>"
$env:PKR_VAR_vsphere_password      = "<password>"
$env:PKR_VAR_winrm_username        = "<username>"
$env:PKR_VAR_winrm_password        = "<password>"
$env:PKR_VAR_ssh_username          = "<username>"
$env:PKR_VAR_ssh_password          = "<password>"
```

## Usage

*Note the '.' at the end.  This isnt a typo!  This tells Packer to process all the configuration files in the current directory.  This allows you to separate out your config to make it easier to manage and reuse.*

```
$ packer build -var-file="win2019core.pkrvar.hcl" .
```