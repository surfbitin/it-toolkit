# Check-SecureBootStatus.ps1
# Check SecureBoot and UEFI settings

Write-Host "Secure Boot and UEFI Status" -ForegroundColor Green
Write-Host "============================" -ForegroundColor Green
Write-Host ""

try {
    # Check SecureBoot status
    $secureBootStatus = Confirm-SecureBootUEFI
    Write-Host "Secure Boot Status: $(if ($secureBootStatus) {'ENABLED'} else {'DISABLED'})" -ForegroundColor $(if ($secureBootStatus) {'Green'} else {'Yellow'})
    
    # Get firmware type
    $firmwareType = Get-SecureBootPolicy | Select-Object -ExpandProperty PSComputerName
    Write-Host "Firmware Type: $(Get-ComputerInfo | Select-Object -ExpandProperty BiosFirmwareType)"
    
    # Get TPM status
    Write-Host ""
    Write-Host "TPM Status:" -ForegroundColor Yellow
    Get-WmiObject win32_tpm -Namespace root\cimv2\security\microsofttpm | Select-Object IsActivated_InitialValue, IsEnabled_InitialValue, IsOwned_InitialValue
    
} catch {
    Write-Host "This system does not support Secure Boot or TPM" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Recommendations:" -ForegroundColor Yellow
Write-Host "  - Keep Secure Boot enabled for enhanced security"
Write-Host "  - Enable TPM 2.0 if available"
Write-Host "  - Regularly update firmware"
