# Install required software
Write-Host "Installing software..."

# Example: Install Chrome
$chromeInstallerUrl = "https://softwaresb.blob.core.windows.net/win11softwares/ChromeStandaloneSetup64.exe?sp=r&st=2023-07-15T18:23:35Z&se=2023-07-16T02:23:35Z&spr=https&sv=2022-11-02&sr=c&sig=qvUgCwZX9P2D%2BjfxA3%2BKbiVTFAU9LP6tpHUg1Xv2tJo%3D"
# $chromeInstallerPath = "C:\Temp\chrome_installer.exe"

# # Download Chrome installer
#Invoke-WebRequest -Uri $chromeInstallerUrl -OutFile $chromeInstallerPath

# Install Chrome silently
#Start-Process -FilePath $chromeInstallerPath -ArgumentList "/silent" -Wait

$Path = $env:TEMP; $Installer = 'chrome_installer.exe'; Invoke-WebRequest -Uri $chromeInstallerUrl  -OutFile $Path\$Installer; Start-Process -FilePath $Path\$Installer -Args '/silent /install' -Verb RunAs -Wait; Remove-Item -Path $Path\$Installer
