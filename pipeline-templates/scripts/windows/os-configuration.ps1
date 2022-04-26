# ----------------------------------------------------------------------------
# Name:         os-configuration.ps1
# Description:  All additional configuration of the build is completed here post deployment of the OS.  This is likely where any adjustments to the build will be made.
#               This script is signed and will need to be resigned if modified.
# Author:       Stephan McTighe
# URL:          https://github.com/smctighevcp/
# Date:         12/11/2021
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Security Configurations

#Disable TLS 1.0
Write-Host "---Disabling old TLS versions ..."
new-item -path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols" -Name "TLS 1.0" | Out-Null
new-item -path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0" -Name "Server" | Out-Null
new-item -path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0" -Name "Client" | Out-Null
new-itemproperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client" -Name "Enabled" -Value 0 | Out-Null
new-itemproperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client" -Name "DisabledByDefault" -Value 1 | Out-Null
new-itemproperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server" -Name "Enabled" -Value 0 | Out-Null
new-itemproperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server" -Name "DisabledByDefault" -Value 1 | Out-Null

#Disable TLS 1.1
new-item -path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols" -Name "TLS 1.1" | Out-Null
new-item -path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1" -Name "Server" | Out-Null
new-item -path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1" -Name "Client" | Out-Null
new-itemproperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client" -Name "Enabled" -Value 0 | Out-Null
new-itemproperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client" -Name "DisabledByDefault" -Value 1 | Out-Null
new-itemproperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server" -Name "Enabled" -Value 0 | Out-Null
new-itemproperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server" -Name "DisabledByDefault" -Value 1 | Out-Null
Write-Host "---TLS Disabled!"
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Connection Configurations

#Enable RDP and Firewall Ports
Write-Host "---Enabling RDP ..."
netsh advfirewall firewall add rule name="Open Port 3389" dir=in action=allow protocol=TCP localport=3389  | Out-Null
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f  | Out-Null
Write-Host "---RDP Enabled!"
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Other Configurations

# Disable system hibernation
Write-Host "---Disabling System Hibernation ..."
Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Power\" -Name "HiberFileSizePercent" -Value 0 | Out-Null
Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Power\" -Name "HibernateEnabled" -Value 0 | Out-Null
Write-Host "---Hibernation Disabled!"
# ----------------------------------------------------------------------------

# Show file extensions
Write-Host "---Enabling Show File Extentions ..."
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\" -Name "HideFileExt" -Value 0 | Out-Null
Write-Host "---Show File Extentions Enabled!"
# ----------------------------------------------------------------------------

# Show Run command in Start Menu
Write-Host "---Enabling Run Command in Start Menu ..."
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\" -Name "Start_ShowRun" -Value 1 | Out-Null
Write-Host "---Run Command Added to Start Menu!"
# ----------------------------------------------------------------------------