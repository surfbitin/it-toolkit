param(
    [string]$ComputerName = "$env:COMPUTERNAME"
)

function Check-SecureBootStatus {
    <#
    .SYNOPSIS
    Check the Secure Boot status of a Windows system.
    
    .PARAMETER ComputerName
    The computer name to check. Defaults to the local computer.
    #>
    
    try {
        $secureBootStatus = Confirm-SecureBootUEFI
        
        if ($secureBootStatus) {
            Write-Host "[✓] Secure Boot is ENABLED" -ForegroundColor Green
        } else {
            Write-Host "[✗] Secure Boot is DISABLED" -ForegroundColor Red
        }
        
        # Get additional security info
        $tpm = Get-WmiObject -Namespace "root\cimv2\security\microsofttpm" -Class Win32_Tpm | Select-Object -ExpandProperty IsActivated_InitialValue
        
        if ($tpm) {
            Write-Host "[✓] TPM 2.0 is AVAILABLE" -ForegroundColor Green
        } else {
            Write-Host "[✗] TPM 2.0 is NOT AVAILABLE" -ForegroundColor Red
        }
        
    } catch {
        Write-Host "[!] Error: $_" -ForegroundColor Yellow
    }
}

Check-SecureBootStatus
