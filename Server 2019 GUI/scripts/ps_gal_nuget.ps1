Set-PSRepository PSGallery -InstallationPolicy Trusted
Register-PackageSource -Name Nuget -Location "http://www.nuget.org/api/v2" –ProviderName Nuget -Trusted