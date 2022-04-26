# ----------------------------------------------------------------------------
# Name:         cleanup.ps1
# Description:  Cleanup configuration and eventlogs.
# Author:       Stephan McTighe
# URL:          https://github.com/smctighevcp/
# Date:         12/11/2021
# ----------------------------------------------------------------------------

Write-Host "---Beginning Cleanup Activities ..."

#Clean EventLog
Write-Host "---Cleaning Windows EventLogs"
Get-EventLog -LogName * | ForEach { Clear-EventLog -LogName $_.Log } -Verbose
Write-Host "---Logs Cleared!"

#Enable firewall (RDP and WinRM FW rules are included as part of the configuration)
Write-Host "---Enabling Windows Firewall ..."
netsh Advfirewall set allprofiles state on | Out-Null
Write-Host "---Windows Firewall Enabled!..."

Write-Host "---Cleanup Activities Complete! ..."
