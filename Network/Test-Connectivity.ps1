<#
.SYNOPSIS
    Test connectivity to common services
.DESCRIPTION
    Tests connectivity to DNS, Gateway, and Internet
.PARAMETER ComputerName
    Remote computer to test (optional)
.EXAMPLE
    .\Test-Connectivity.ps1
    .\Test-Connectivity.ps1 -ComputerName "192.168.1.100"
#>

param(
    [string]$ComputerName = "8.8.8.8"
)

Write-Host "Testing connectivity..." -ForegroundColor Green

$tests = @(
    @{Name="Google DNS"; Host="8.8.8.8"},
    @{Name="Cloudflare DNS"; Host="1.1.1.1"},
    @{Name="Default Gateway"; Host=(Get-NetRoute -DestinationPrefix "0.0.0.0/0" | Select-Object -First 1).NextHop}
)

foreach ($test in $tests) {
    $result = Test-Connection -ComputerName $test.Host -Count 1 -ErrorAction SilentlyContinue
    $status = if ($result) { "✓ Online" } else { "✗ Offline" }
    Write-Host "$($test.Name): $status" -ForegroundColor $(if ($result) { "Green" } else { "Red" })
}