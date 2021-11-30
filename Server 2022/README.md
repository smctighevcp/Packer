# Packer

## Windows Server 2022

 This repository contains a Packer build for Windows Server 2022 using the vSphere-ISO builder.
 These are my updated configurations using HCL rather than JSON following the release of Packer 1.7.

## Structure
- ->config
    - ->win-2022-core
	    - ->autounattend.xml
    - ->win-2022-gui
        - ->autounattend.xml
- ->scripts
    - ->cleanup.ps1
	- ->initial-configuration.ps1
	- ->os-configuration.ps1
- ->vars
    - ->win-2022-core
        - ->win2022core.pkrvar.hcl
    - ->win-2022-gui
        - ->win2022gui.pkrvar.hcl
- ->build.pkr.hcl
- ->variables.pkr.hcl

## Files
- variables.pkr.hcl - Variable declaration file
- build.pkr.hcl - Build file containing both core and gui versions
- win2022core.pkrvar.hcl - User Defined variables file for the 2022 core build
- win2022gui.pkrvar.hcl - User Defined variables file for the 2022 gui build

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

As both builds are part of a single configuration, you can use the --only parameter to specify which build you want.  This helps to reduce the amount of duplicate versions of configuration you need to maintain.

```
$ packer build --only vsphere-iso.win-2022-std-gui -var-file="vars/win-2022-gui/win2022gui.pkrvar.hcl" .
$ packer build --only vsphere-iso.win-2022-std-core -var-file="vars/win-2022-core/win2022core.pkrvar.hcl" .

```