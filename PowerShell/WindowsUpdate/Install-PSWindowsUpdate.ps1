# Configure PowerShell gallery
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

# Allow running local scripts
Set-ExecutionPolicy RemoteSigned -Scope LocalMachine -Force

# Install module
Install-PackageProvider -Name NuGet -Force
Install-Module PSWindowsUpdate -Force -Confirm:$false

# Load module
Import-Module PSWindowsUpdate

# Register Microsoft Update
Add-WUServiceManager -MicrosoftUpdate -Confirm:$false
