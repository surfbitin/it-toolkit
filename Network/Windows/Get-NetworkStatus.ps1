# Get-NetworkStatus.ps1
# Displays network interfaces and IP configuration

param(
    [switch]$Detailed
)

try {
    Write-Host "Network Status" -ForegroundColor Green
    Write-Host "==============" -ForegroundColor Green
    
    if ($Detailed) {
        Get-NetAdapter | Select-Object Name, Status, LinkSpeed, MacAddress | Format-Table -AutoSize
        Write-Host ""
        Get-NetIPConfiguration | Format-List
    } else {
        Get-NetAdapter | Select-Object Name, Status, LinkSpeed | Format-Table -AutoSize
        Write-Host ""
        Get-NetIPAddress -AddressFamily IPv4 | Select-Object InterfaceAlias, IPAddress | Format-Table -AutoSize
    }
} catch {
    Write-Error "Error retrieving network status: $_"
}
