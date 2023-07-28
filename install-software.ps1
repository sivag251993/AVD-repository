# Install required software
Write-Host "Installing software..."

# Example: Install Chrome
$chromeInstallerUrl = "https://avdpipe.blob.core.windows.net/software/ChromeStandaloneSetup64.exe?sp=r&st=2023-07-28T04:48:41Z&se=2023-08-28T12:48:41Z&spr=https&sv=2022-11-02&sr=b&sig=2zLo%2B4vEgqWOYT3%2FV%2BRPP43IdRcng1Z8At7ZrGPaSMM%3D"
# $chromeInstallerPath = "C:\Temp\chrome_installer.exe"

# # Download Chrome installer
#Invoke-WebRequest -Uri $chromeInstallerUrl -OutFile $chromeInstallerPath

# Install Chrome silently
#Start-Process -FilePath $chromeInstallerPath -ArgumentList "/silent" -Wait

$Path = $env:TEMP; $Installer = 'chrome_installer.exe'; Invoke-WebRequest -Uri $chromeInstallerUrl  -OutFile $Path\$Installer; Start-Process -FilePath $Path\$Installer -Args '/silent /install' -Verb RunAs -Wait; Remove-Item -Path $Path\$Installer
