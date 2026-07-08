# System Tools

System information, monitoring, and maintenance utilities for Windows and Linux platforms.

## Contents

### Windows (PowerShell)
- `Windows/Get-SystemInfo.ps1` - Display comprehensive system information
- `Windows/Get-DiskUsage.ps1` - Analyze disk usage by drive
- `Windows/Monitor-SystemHealth.ps1` - Monitor CPU, memory, and disk health
- `Windows/Get-ProcessInfo.ps1` - Get detailed process information
- `Windows/Check-SystemLogs.ps1` - Check system event logs

### Linux (Bash)
- `Linux/get-system-info.sh` - Display comprehensive system information
- `Linux/get-disk-usage.sh` - Analyze disk usage by directory
- `Linux/monitor-processes.sh` - Monitor running processes by CPU and memory
- `Linux/check-system-resources.sh` - Check CPU, memory, and load average
- `Linux/generate-system-report.sh` - Generate comprehensive system report

## Usage

### Windows
```powershell
.\System\Windows\Get-SystemInfo.ps1
.\System\Windows\Get-DiskUsage.ps1
.\System\Windows\Monitor-SystemHealth.ps1
```

### Linux
```bash
chmod +x System/Linux/*.sh
./System/Linux/get-system-info.sh
./System/Linux/get-disk-usage.sh
./System/Linux/monitor-processes.sh
```

## Requirements

### PowerShell
- PowerShell 5.0+

### Bash
- Bash 4.0+
- Common utilities: grep, awk, df, ps, free
