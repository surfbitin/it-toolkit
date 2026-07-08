# PowerShell Tools

A collection of PowerShell scripts for Windows IT administration and automation.

## Directory Structure

### Security/
- `Check-SecureBootStatus.ps1` - Check Secure Boot and TPM 2.0 status

### System/
- `Get-SystemInfo.ps1` - Get comprehensive system information
- `Get-DiskUsage.ps1` - Analyze disk usage by directory

### Network/
- `Get-NetworkStatus.ps1` - Display network interfaces and IP configuration
- `Test-Connectivity.ps1` - Test connectivity to DNS, gateway, and internet

### FileManagement/
- `Remove-OldFiles.ps1` - Remove files older than specified days

### Utilities/
- `Invoke-PSProfile.ps1` - Load and execute PowerShell profile

## Usage

Run a script directly:
```powershell
.\PowerShell\System\Get-SystemInfo.ps1
```

Run with parameters:
```powershell
.\PowerShell\FileManagement\Remove-OldFiles.ps1 -Path "C:\temp" -Days 7 -WhatIf
```

## Requirements

- PowerShell 5.0 or higher (or PowerShell Core)
- Administrator privileges for most scripts
- Windows 10/11 or Windows Server 2016+
