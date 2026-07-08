<#
.SYNOPSIS
    Display comprehensive system information
.DESCRIPTION
    Shows CPU, RAM, Disk, OS, and uptime information
.EXAMPLE
    .\Get-SystemInfo.ps1
#>

Write-Host "=== SYSTEM INFORMATION ===" -ForegroundColor Cyan

$OS = Get-CimInstance -ClassName Win32_OperatingSystem
$CPU = Get-CimInstance -ClassName Win32_Processor | Select-Object -First 1
$RAM = Get-CimInstance -ClassName Win32_ComputerSystem
$Disk = Get-PSDrive -Name C

Write-Host "`nOperating System:" -ForegroundColor Green
Write-Host "  OS: $($OS.Caption)"
Write-Host "  Version: $($OS.Version)"
Write-Host "  Uptime: $(([datetime]::Now - $OS.LastBootUpTime).Days) days"

Write-Host "`nCPU:" -ForegroundColor Green
Write-Host "  Processor: $($CPU.Name)"
Write-Host "  Cores: $($CPU.NumberOfCores)"
Write-Host "  Logical Processors: $($CPU.NumberOfLogicalProcessors)"

Write-Host "`nMemory:" -ForegroundColor Green
Write-Host "  Total RAM: $([math]::Round($RAM.TotalPhysicalMemory/1GB, 2)) GB"
Write-Host "  Available RAM: $([math]::Round((Get-CimInstance -ClassName Win32_OperatingSystem).FreePhysicalMemory/1MB, 2)) MB"

Write-Host "`nDisk Space (C:):" -ForegroundColor Green
Write-Host "  Total: $([math]::Round($Disk.Used/1GB + $Disk.Free/1GB, 2)) GB"
Write-Host "  Used: $([math]::Round($Disk.Used/1GB, 2)) GB"
Write-Host "  Free: $([math]::Round($Disk.Free/1GB, 2)) GB"