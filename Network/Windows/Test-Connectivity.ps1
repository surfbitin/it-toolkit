# Test-Connectivity.ps1
# Tests connectivity to DNS, gateway, and internet

param(
    [string]$TestHost = "8.8.8.8",
    [string]$DNSServer = "8.8.8.8",
    [int]$Timeout = 4
)

try {
    Write-Host "Connectivity Test" -ForegroundColor Green
    Write-Host "=================" -ForegroundColor Green
    
    # Test gateway
    Write-Host "Testing Gateway..." -ForegroundColor Yellow
    $gateway = Get-NetRoute | Where-Object {$_.DestinationPrefix -eq "0.0.0.0/0"} | Select-Object -ExpandProperty NextHop
    $gatewayTest = Test-Connection -ComputerName $gateway -Count 1 -Quiet
    Write-Host "Gateway ($gateway): $(if ($gatewayTest) {'OK'} else {'FAILED'})" -ForegroundColor $(if ($gatewayTest) {'Green'} else {'Red'})
    
    # Test DNS
    Write-Host "Testing DNS..." -ForegroundColor Yellow
    $dnsTest = Test-Connection -ComputerName $DNSServer -Count 1 -Quiet
    Write-Host "DNS ($DNSServer): $(if ($dnsTest) {'OK'} else {'FAILED'})" -ForegroundColor $(if ($dnsTest) {'Green'} else {'Red'})
    
    # Test Internet
    Write-Host "Testing Internet..." -ForegroundColor Yellow
    $internetTest = Test-Connection -ComputerName $TestHost -Count 1 -Quiet
    Write-Host "Internet ($TestHost): $(if ($internetTest) {'OK'} else {'FAILED'})" -ForegroundColor $(if ($internetTest) {'Green'} else {'Red'})
    
    Write-Host ""
    $allGood = $gatewayTest -and $dnsTest -and $internetTest
    Write-Host "Overall Status: $(if ($allGood) {'CONNECTED'} else {'ISSUES DETECTED'})" -ForegroundColor $(if ($allGood) {'Green'} else {'Red'})
} catch {
    Write-Error "Error during connectivity test: $_"
}
