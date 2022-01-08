$welcome = @"

8eee8            8eeee8                            8   8                            8eeee8`
  8  e   e eeee  8      eeeeeee eeeee e     e      8   8 e   e eeeeeee eeeee eeeee  8    " e     eeeee e   e eeeee
  8e 8   8 8     8eeeee 8  8  8 8   8 8     8      8eee8 8   8 8  8  8 8   8 8   8  8e     8     8  88 8   8 8   8
  88 8eee8 8eee      88 8e 8  8 8eee8 8e    8e     88  8 8e  8 8e 8  8 8eee8 8e  8  88     8e    8   8 8e  8 8e  8
  88 88  8 88    e   88 88 8  8 88  8 88    88     88  8 88  8 88 8  8 88  8 88  8  88   e 88    8   8 88  8 88  8
  88 88  8 88ee  8eee88 88 8  8 88  8 88eee 88eee  88  8 88ee8 88 8  8 88  8 88  8  88eee8 88eee 8eee8 88ee8 88ee8

"@

Write-Host $welcome -ForegroundColor Blue

#Get Credentials
$Credentialnonlocal = Import-Clixml "N:\Software\Secure\vSphere\admin.vsphere.local.secure"
$Credentiallocal = Import-Clixml "N:\Software\Secure\local-os\local.admin.secure"

#Create Packer environment variables
$env:PKR_VAR_vsphere_password = $Credentialnonlocal.GetNetworkCredential().Password
$env:PKR_VAR_communicator_password = $Credentiallocal.GetNetworkCredential().Password

#Change to Packer working directory
Set-Location "C:\GitHub_Repos\Packer\vm-templates"

#Menu & Build
Do {
    Write-Host "================ Select a HashiCorp Packer build for VMware vSphere: ================" -ForegroundColor Yellow

    Write-Host "1: Windows Server 2022 Standard - Desktop Experience" -ForegroundColor Green
    Write-Host "2: Windows Server 2022 Standard - Core" -ForegroundColor Green
    Write-Host "3: VMware Photon OS 4" -ForegroundColor Green
    Write-Host "4: Red Hat Enterprise Linux 8" -ForegroundColor Green
    Write-Host "Q: Quit" -ForegroundColor Red

    $selection = Read-Host "Please make a selection"
    switch ($selection) {
        '1' {
            Write-Host " --- Building a Windows Server 2022 Standard - Desktop Experience Template (OVF) for VMware vSphere ..." -ForegroundColor Green

            #Specify the Build
            $BuildVersion = "win-2022-std-gui"
            $BuildDate = get-date -f yyyyMMdd-HHmm

            #Enable and set logging location
            $env:PACKER_LOG = 1
            $env:PACKER_LOG_PATH = "C:\Temp\packerlog-$($BuildVersion)-$($BuildDate).txt"

            #Build template!
            packer build --only vsphere-iso.win-2022-std-gui -var-file="vars/win-2022-gui/win2022gui.pkrvar.hcl" .
        }
        '2' {
            Write-Host " --- Building a Windows Server 2022 Standard - Core Template (OVF) for VMware vSphere ..." -ForegroundColor Green

            #Specify the Build
            $BuildVersion = "win-2022-std-core"
            $BuildDate = get-date -f yyyyMMdd-HHmm

            #Enable and set logging location
            $env:PACKER_LOG = 1
            $env:PACKER_LOG_PATH = "C:\Temp\packerlog-$($BuildVersion)-$($BuildDate).txt"

            #Build template!
            packer build --only vsphere-iso.win-2022-std-core -var-file="vars/win-2022-core/win2022core.pkrvar.hcl" .
        }
        '3' {
            Write-Host " --- Building a VMware Photon OS 4 Template (OVF) for VMware vSphere ..." -ForegroundColor Green

            #Specify the Build
            $BuildVersion = "lin-pho-4"
            $BuildDate = get-date -f yyyyMMdd-HHmm

            #Enable and set logging location
            $env:PACKER_LOG = 1
            $env:PACKER_LOG_PATH = "C:\Temp\packerlog-$($BuildVersion)-$($BuildDate).txt"

            #Build template!
            packer build --only vsphere-iso.photon-4 -var-file="vars/lin-pho-4/photon_4.pkrvar.hcl" .
        }
        '4' {
            Write-Host " --- Building a Red Hat Enterprise Linux 8 Template (OVF) for VMware vSphere ..." -ForegroundColor Green

            #Specify the Build
            $BuildVersion = "lin-rhl-8"
            $BuildDate = get-date -f yyyyMMdd-HHmm

            #Enable and set logging location
            $env:PACKER_LOG = 1
            $env:PACKER_LOG_PATH = "C:\Temp\packerlog-$($BuildVersion)-$($BuildDate).txt"

            #Build template!
            packer build --only vsphere-iso.rhel-8 -var-file="vars/lin-rhel-8.5/rhel-8.5.pkrvar.hcl" .
        }
    }
    pause
}
until ($selection -eq 'q')