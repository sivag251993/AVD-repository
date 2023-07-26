# Install required software
Write-Host "Installing software..."

# Example: Install Chrome
$chromeInstallerUrl = "https://sivastorageavd001.blob.core.windows.net/sofftware/ChromeStandaloneSetup64.exe?sp=r&st=2023-07-26T06:42:46Z&se=2023-08-26T14:42:46Z&spr=https&sv=2022-11-02&sr=b&sig=2AhjkvHBc5fYfMBXFlBjG5g7UTYN5A55f9BIi6BVdio%3D"
# $chromeInstallerPath = "C:\Temp\chrome_installer.exe"

# # Download Chrome installer
#Invoke-WebRequest -Uri $chromeInstallerUrl -OutFile $chromeInstallerPath

# Install Chrome silently
#Start-Process -FilePath $chromeInstallerPath -ArgumentList "/silent" -Wait

$Path = $env:TEMP; $Installer = 'chrome_installer.exe'; Invoke-WebRequest -Uri $chromeInstallerUrl  -OutFile $Path\$Installer; Start-Process -FilePath $Path\$Installer -Args '/silent /install' -Verb RunAs -Wait; Remove-Item -Path $Path\$Installer
