function Get-NetworkStatus {
    <#
    .SYNOPSIS
    Display network interfaces and IP configuration.
    #>
    
    Write-Host "=== NETWORK STATUS ===" -ForegroundColor Cyan
    Write-Host ""
    
    Get-NetIPAddress | ForEach-Object {
        Write-Host "Interface: $($_.InterfaceAlias)" -ForegroundColor Green
        Write-Host "  IP Address: $($_.IPAddress)"
        Write-Host "  Prefix Length: $($_.PrefixLength)"
        Write-Host ""
    }
}

Get-NetworkStatus
