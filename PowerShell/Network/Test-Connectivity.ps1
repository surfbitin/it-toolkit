param(
    [string]$Gateway = "",
    [string]$DNS = "8.8.8.8",
    [string]$TestHost = "google.com"
)

function Test-Connectivity {
    <#
    .SYNOPSIS
    Test connectivity to DNS, gateway, and internet.
    #>
    
    Write-Host "=== CONNECTIVITY TEST ===" -ForegroundColor Cyan
    Write-Host ""
    
    # Test DNS
    Write-Host "Testing DNS ($DNS)..." -ForegroundColor Yellow
    if (Test-Connection -ComputerName $DNS -Count 1 -ErrorAction SilentlyContinue) {
        Write-Host "[✓] DNS is reachable" -ForegroundColor Green
    } else {
        Write-Host "[✗] DNS is unreachable" -ForegroundColor Red
    }
    
    # Test Internet
    Write-Host "Testing Internet ($TestHost)..." -ForegroundColor Yellow
    if (Test-Connection -ComputerName $TestHost -Count 1 -ErrorAction SilentlyContinue) {
        Write-Host "[✓] Internet is reachable" -ForegroundColor Green
    } else {
        Write-Host "[✗] Internet is unreachable" -ForegroundColor Red
    }
    
    # Test Gateway if provided
    if ($Gateway) {
        Write-Host "Testing Gateway ($Gateway)..." -ForegroundColor Yellow
        if (Test-Connection -ComputerName $Gateway -Count 1 -ErrorAction SilentlyContinue) {
            Write-Host "[✓] Gateway is reachable" -ForegroundColor Green
        } else {
            Write-Host "[✗] Gateway is unreachable" -ForegroundColor Red
        }
    }
}

Test-Connectivity -Gateway $Gateway -DNS $DNS -TestHost $TestHost
