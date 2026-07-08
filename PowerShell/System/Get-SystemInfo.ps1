function Get-SystemInfo {
    <#
    .SYNOPSIS
    Get comprehensive system information.
    #>
    
    Write-Host "=== SYSTEM INFORMATION ===" -ForegroundColor Cyan
    
    $osInfo = Get-WmiObject -Class Win32_OperatingSystem
    $computerInfo = Get-WmiObject -Class Win32_ComputerSystem
    $processor = Get-WmiObject -Class Win32_Processor
    
    Write-Host ""
    Write-Host "Computer Name: $($computerInfo.Name)"
    Write-Host "OS: $($osInfo.Caption)"
    Write-Host "OS Version: $($osInfo.Version)"
    Write-Host "System Manufacturer: $($computerInfo.Manufacturer)"
    Write-Host "System Model: $($computerInfo.Model)"
    Write-Host "Processor: $($processor.Name)"
    Write-Host "Cores: $($processor.NumberOfCores)"
    Write-Host "Logical Processors: $($processor.NumberOfLogicalProcessors)"
    
    $ram = [math]::Round($computerInfo.TotalPhysicalMemory / 1GB, 2)
    Write-Host "RAM: $ram GB"
    
    Write-Host "Install Date: $($osInfo.InstallDate -replace '^(\d{4})(\d{2})(\d{2})', '$1-$2-$3')"
    Write-Host "Last Boot: $(Get-Date -Date ([Management.ManagementDateTimeConverter]::ToDateTime($osInfo.LastBootUpTime)) -Format 'yyyy-MM-dd HH:mm:ss')"
    
}

Get-SystemInfo
