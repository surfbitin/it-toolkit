<#
.SYNOPSIS
    Check Secure Boot status
.DESCRIPTION
    Displays Secure Boot and TPM status
.EXAMPLE
    .\Check-SecureBootStatus.ps1
#>

Write-Host "=== SECURITY STATUS ===" -ForegroundColor Cyan

$SecureBoot = Get-CimInstance -ClassName Win32_ComputerSystemSecurityProcessInfo -ErrorAction SilentlyContinue
if ($SecureBoot) {
    Write-Host "Secure Boot: Supported" -ForegroundColor Green
    $status = (Get-CimInstance -ClassName Win32_SystemSecuritySettings).SecureBootState
    Write-Host "Secure Boot State: $(if ($status -eq 1) { 'Enabled ✓' } else { 'Disabled ✗' })" -ForegroundColor $(if ($status -eq 1) { 'Green' } else { 'Yellow' })
} else {
    Write-Host "Secure Boot: Not Supported" -ForegroundColor Yellow
}

$TPM = Get-CimInstance -ClassName Win32_Tpm -Namespace root\cimv2\security\microsofttpm -ErrorAction SilentlyContinue
if ($TPM) {
    Write-Host "TPM: Present and Enabled ✓" -ForegroundColor Green
} else {
    Write-Host "TPM: Not Available" -ForegroundColor Yellow
}

Write-Host "`nBitLocker Status:" -ForegroundColor Green
try {
    Get-BitLockerVolume | Select-Object MountPoint, ProtectionStatus, EncryptionPercentage | Format-Table
} catch {
    Write-Host "BitLocker not available or not running as administrator" -ForegroundColor Yellow
}