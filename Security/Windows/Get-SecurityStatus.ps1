# Get-SecurityStatus.ps1
# Get comprehensive security status

Write-Host "Windows Security Status" -ForegroundColor Green
Write-Host "======================" -ForegroundColor Green
Write-Host ""

# Windows Defender
Write-Host "Windows Defender:" -ForegroundColor Yellow
$defenderStatus = Get-MpComputerStatus
Write-Host "  Status: $(if ($defenderStatus.AntivirusEnabled) {'ENABLED'} else {'DISABLED'})"
Write-Host "  Real-time Monitoring: $(if ($defenderStatus.RealTimeProtectionEnabled) {'ENABLED'} else {'DISABLED'})"
Write-Host "  Last Scan: $($defenderStatus.LastFullScanTime)"

# Firewall
Write-Host ""
Write-Host "Windows Firewall:" -ForegroundColor Yellow
Get-NetFirewallProfile | Select-Object Name, Enabled | Format-Table -AutoSize

# UAC
Write-Host ""
Write-Host "User Account Control (UAC):" -ForegroundColor Yellow
$uac = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System | Select-Object -ExpandProperty EnableLUA
Write-Host "  Status: $(if ($uac -eq 1) {'ENABLED'} else {'DISABLED'})"

# Windows Updates
Write-Host ""
Write-Host "Windows Updates:" -ForegroundColor Yellow
$updates = Get-HotFix | Sort-Object InstalledOn -Descending | Select-Object -First 5
Write-Host "  Recent Updates:"
$updates | ForEach-Object { Write-Host "    - $($_.HotFixID): $($_.Description)" }
