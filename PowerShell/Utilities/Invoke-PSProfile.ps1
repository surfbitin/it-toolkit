function Invoke-PSProfile {
    <#
    .SYNOPSIS
    Load and execute the PowerShell profile.
    #>
    
    if (Test-Path $PROFILE) {
        Write-Host "Loading PowerShell profile..." -ForegroundColor Cyan
        . $PROFILE
        Write-Host "[✓] Profile loaded" -ForegroundColor Green
    } else {
        Write-Host "[!] PowerShell profile not found at: $PROFILE" -ForegroundColor Yellow
    }
}

Invoke-PSProfile
