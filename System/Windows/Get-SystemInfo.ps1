# Get-SystemInfo.ps1
# Display comprehensive system information

Write-Host "System Information" -ForegroundColor Green
Write-Host "==================" -ForegroundColor Green
Write-Host ""

$osInfo = Get-ComputerInfo
$cpuInfo = Get-WmiObject win32_processor
$memInfo = Get-WmiObject win32_physicalmemory

Write-Host "Computer Information:" -ForegroundColor Yellow
Write-Host "  Computer Name: $($osInfo.CsComputerName)"
Write-Host "  Domain: $($osInfo.CsDomain)"
Write-Host "  OS: $($osInfo.OsName)"
Write-Host "  OS Version: $($osInfo.WindowsVersion)"
Write-Host "  Install Date: $($osInfo.OsInstallDate)"
Write-Host "  Last Boot: $($osInfo.OsLastBootUpTime)"
Write-Host ""

Write-Host "CPU Information:" -ForegroundColor Yellow
Write-Host "  Processor: $($cpuInfo.Name)"
Write-Host "  Cores: $($cpuInfo.NumberOfCores)"
Write-Host "  Logical Processors: $($cpuInfo.NumberOfLogicalProcessors)"
Write-Host "  Speed: $($cpuInfo.MaxClockSpeed) MHz"
Write-Host ""

Write-Host "Memory Information:" -ForegroundColor Yellow
$totalRam = ($memInfo | Measure-Object -Property Capacity -Sum | Select-Object -ExpandProperty Sum) / 1GB
Write-Host "  Total RAM: $([Math]::Round($totalRam)) GB"
Write-Host "  Available RAM: $([Math]::Round((Get-WmiObject win32_operatingsystem).FreePhysicalMemory / 1MB)) MB"
Write-Host ""

Write-Host "Disk Information:" -ForegroundColor Yellow
Get-Volume | Where-Object {$_.DriveType -eq 'Fixed'} | Select-Object DriveLetter, FileSystemLabel, Size, SizeRemaining | ForEach-Object {
    $percentFree = ($_.SizeRemaining / $_.Size) * 100
    Write-Host "  Drive $($_.DriveLetter): $(([Math]::Round($_.Size / 1GB))) GB total, $(([Math]::Round($_.SizeRemaining / 1GB))) GB free ($([Math]::Round($percentFree))%)"
}
