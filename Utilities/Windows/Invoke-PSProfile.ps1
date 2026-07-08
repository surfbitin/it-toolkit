# Invoke-PSProfile.ps1
# Load PowerShell profile settings

Write-Host "PowerShell Profile Manager" -ForegroundColor Green
Write-Host "===========================" -ForegroundColor Green
Write-Host ""

$profilePath = $PROFILE.CurrentUserCurrentHost
Write-Host "Profile Path: $profilePath"
Write-Host ""

if (Test-Path $profilePath) {
    Write-Host "Profile exists. Content:" -ForegroundColor Yellow
    Get-Content $profilePath
    Write-Host ""
    Write-Host "Reloading profile..." -ForegroundColor Green
    & $profilePath
    Write-Host "Profile loaded successfully" -ForegroundColor Green
} else {
    Write-Host "Profile does not exist. Creating new profile..." -ForegroundColor Yellow
    New-Item -Path $profilePath -ItemType File -Force | Out-Null
    Write-Host "Profile created at: $profilePath" -ForegroundColor Green
}
