# Packer

## Windows Server 2019 Core
 
 This repository contains a Packer build for Windows Server 2019 using the vSphere-ISO builder.
 These are my updated configurations using HCL rather than JSON following the release of Packer 1.7.

## Structure

## Files


## Environmental Variables
In order to not record sensitive variables in the confguration files, you can make use of environmental variables (This configuration uses user defined variables, see the consolidated configuration for environmental usage).  These are added the the PowerShell session or Shell session before building the template.  This is especially useful should you wish to run the build as part of a workflow and/or feed in secrets from a password management solution. 

The Packer configuration picks these up based on the PKR_VAR prefix (you dont need to add this prefix in your config).

- $env:PKR_VAR_vsphere_user          = "<username>"
- $env:PKR_VAR_vsphere_password      = "<password>"
- $env:PKR_VAR_winrm_username        = "<username>"
- $env:PKR_VAR_winrm_password        = "<password>"
- $env:PKR_VAR_ssh_username          = "<username>"
- $env:PKR_VAR_ssh_password          = "<password>"

## Usage

*Note the '.' at the end.  This isnt a typo!  This tells Packer to process all the configuration files in the current directory.  This allows you to separate out your config to make it easier to manage and reuse.*

$ packer build -var-file="win2019core.pkrvar.hcl" .