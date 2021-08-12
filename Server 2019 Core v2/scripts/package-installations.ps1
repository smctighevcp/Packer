#Package Installations
#This file downloads a ZIP file from the Packer Host, extracts the content and installs the applications or agents.
#There is a simple installation section as well as a section that can be used with commonly packaged apps (via the App Deployment Toolkit for example).
#It then removes all the media from the server.


#Download and Extract Media
try {
    Write-Host "Downloading Apps and Agents Media (Zip) from Packer Server... "
    #Use the IP of the host you are running Packer from.
    Invoke-WebRequest -Uri "http://10.200.15.15:8000/installs.zip" -OutFile C:\temp\installs.zip -UseBasicParsing  -ErrorVariable result
    Write-Host "Downloaded Successfully"
    Write-Host "Extracting Zip to C:\temp"
    Expand-Archive -LiteralPath 'C:\temp\installs.zip' -DestinationPath C:\Temp
    Write-Host "Extraction Complete"
} catch {
    $err = $_
    Write-Host "Download Failed"
    if ($result) {
        Write-Host $result.message
    } else {
        Write-Host $err.message
    }
}
#Install application (based on basic package management)
try {
    Write-Host "Installing Apps and Agents... 7ZIP"
    Start-process "C:\temp\7z1900-x64.exe" -ArgumentList "/S" -ErrorVariable result -Wait
    Write-Host "7ZIP installed successfully"
}

catch {
    $err = $_
    Write-Host "Failed to install"
    if ($result) {
        Write-Host $result.message
    } else {
        Write-Host $err.message
    }
}
#Install all available applications (based on App Deploy Toolkit)
<#
$Apps = get-childitem "C:\temp" -Recurse | Where-object { $_.FullName -like "*.exe" } | Select-Object FullName

foreach ($App in $Apps) {
    try {
        Write-Host "Installing Apps and Agents... $($App.FullName)"
        Start-process $App.FullName -ErrorVariable result -Wait
        Write-Host "$($App.FullName) installed successfully"
    }

    catch {
        $err = $_
        Write-Host "Failed to install"
        if ($result) {
            Write-Host $result.message
        } else {
            Write-Host $err.message
        }
    }
}
#>

#Wait...
Start-Sleep -Seconds 20

#Cleanup
Write-Host "Removing Install content"
Set-Location C:\Temp
Remove-Item * -Recurse
Write-Host "Content Removed"