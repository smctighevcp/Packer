# ----------------------------------------------------------------------------
# Name:         os-configuration.ps1
# Description:  Initial configuration of firewall and WinRM.
# Author:       Stephan McTighe
# URL:          https://github.com/smctighevcp/
# Date:         12/11/2021
# ----------------------------------------------------------------------------

#Disable firewall (Packer needs this to maintain connection)
Write-Host "---Disabling Windows Firewall ..."
netsh Advfirewall set allprofiles state off | Out-Null
Write-Host "---Windows Firewall Disabled..."

#Configure and Enable WinRM (Required for later configurations)
Write-Host "---Enabling WinRM ..."
$NetworkListManager = [Activator]::CreateInstance([Type]::GetTypeFromCLSID([Guid]"{DCB00C01-570F-4A9B-8D69-199FDBA5723B}"))
$Connections = $NetworkListManager.GetNetworkConnections()
$Connections | ForEach-Object { $_.GetNetwork().SetCategory(1) }
Enable-PSRemoting -Force
winrm quickconfig -q
winrm quickconfig -transport:http
winrm set winrm/config '@{MaxTimeoutms="1800000"}'
winrm set winrm/config/winrs '@{MaxMemoryPerShellMB="800"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'
winrm set winrm/config/client/auth '@{Basic="true"}'
winrm set winrm/config/listener?Address=*+Transport=HTTP '@{Port="5985"}'
netsh advfirewall firewall set rule group="Windows Remote Administration" new enable=yes
netsh advfirewall firewall set rule name="Windows Remote Management (HTTP-In)" new enable=yes action=allow
Set-Service winrm -startuptype "auto"
Restart-Service winrm
Write-Host "---WinRM Enabled ..."
