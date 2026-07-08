# Utilities

General purpose helper functions and utilities for Windows and Linux platforms.

## Contents

### Windows (PowerShell)
- `Windows/Invoke-PSProfile.ps1` - Load PowerShell profile settings
- `Windows/Get-SystemReport.ps1` - Generate comprehensive system report
- `Windows/Restart-Services.ps1` - Restart Windows services

### Linux (Bash)
- `Linux/system-health-check.sh` - Perform comprehensive system health check
- `Linux/optimize-system.sh` - Optimize system performance
- `Linux/generate-diagnostics.sh` - Generate comprehensive system diagnostic report

## Usage

### Windows
```powershell
.\Utilities\Windows\Invoke-PSProfile.ps1
.\Utilities\Windows\Get-SystemReport.ps1
```

### Linux
```bash
chmod +x Utilities/Linux/*.sh
./Utilities/Linux/system-health-check.sh
./Utilities/Linux/generate-diagnostics.sh
```

## Requirements

### PowerShell
- PowerShell 5.0+

### Bash
- Bash 4.0+
- Common utilities: grep, awk, sed, systemctl
