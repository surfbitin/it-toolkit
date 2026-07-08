<#
.SYNOPSIS
    Reload PowerShell profile
.DESCRIPTION
    Reloads the current user's PowerShell profile without restarting
.EXAMPLE
    .\Invoke-PSProfile.ps1
#>

& $PROFILE
Write-Host "PowerShell profile reloaded successfully" -ForegroundColor Green