#Source media
$source = \\contentlocation\source$

#7Zip Content
#copy the latest version of the installer to the Packer deployment directories
$destination = "E:\media\applications\7zip"
If (Get-ChildItem $destination) {
    Write-host "7Zip content already available...removing ready for refresh..." -ForegroundColor Yellow
    Remove-Item $destination\* -Recurse
    Write-host "7Zip content removed..." -ForegroundColor Yellow

} else {
    Write-host "No existing content...proceeding" -ForegroundColor Green
}
$7zip = Get-ChildItem -Directory "$source\Applications\7zip" | Sort-Object -Descending -Property LastWriteTime | select -First 1
$7zipPath = ($7zip.PSPath) + "\V1\Package\*"
Write-host "Copying 7Zip content" -ForegroundColor Green
Copy-Item $7zipPath $destination -Recurse
Write-host "Copying 7Zip content complete" -ForegroundColor Green

#Compress all content into a single Zip File
$compress = @{
    Path             = "E:\media\applications\*"
    CompressionLevel = "Fastest"
    DestinationPath  = "E:\media\Installs.zip"
}
Compress-Archive @compress