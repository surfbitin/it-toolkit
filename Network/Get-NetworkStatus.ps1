<#
.SYNOPSIS
    Get network adapter status and configuration
.DESCRIPTION
    Displays detailed information about all network adapters
.EXAMPLE
    .\Get-NetworkStatus.ps1
#>

Get-NetAdapter | Select-Object Name, Status, LinkSpeed, MacAddress | Format-Table -AutoSize

Write-Host "`nDNS Configuration:" -ForegroundColor Cyan
Get-DnsClientServerAddress | Select-Object InterfaceAlias, ServerAddresses | Format-Table -AutoSize