# Packer

## CentOS 7

 This repository contains a Packer build for CentOS 7 using the vSphere-ISO builder.
 These are my updated configurations using HCL rather than JSON following the release of Packer 1.7.

## Structure
- ->config
	- ->ks.cfg
 - ->output
 - ->scripts
	- ->install-vmtools.sh
	- ->update.sh
 - ->variables.pkr.hcl
 - ->centos_7.pkr.hcl
 - ->centos_7.pkrvar.hcl

## Files
- variables.pkr.hcl - Variable declaration file
- centos_7.pkr.hcl - Build file
- centos_7.pkrvar.hcl - User Defined variables file

 ## Environmental Variables
In order to not record sensitive variables in the confguration files, you can make use of environmental variables (This configuration uses user defined variables, see the consolidated configuration for environmental usage).

## Usage

*Note the '.' at the end.  This isnt a typo!  This tells Packer to process all the configuration files in the current directory.  This allows you to separate out your config to make it easier to manage and reuse.*

$ packer build -var-file="centos_7.pkrvar.hcl" .