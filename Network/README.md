# Network Tools

Network diagnostics and utilities for Windows and Linux platforms.

## Contents

### Windows (PowerShell)
- `Windows/Get-NetworkStatus.ps1` - Display network interfaces and IP configuration
- `Windows/Test-Connectivity.ps1` - Test connectivity to DNS, gateway, and internet

### Linux (Bash)
- `Linux/get-network-status.sh` - Display network interfaces and IP configuration
- `Linux/test-connectivity.sh` - Test connectivity to DNS, gateway, and internet
- `Linux/monitor-bandwidth.sh` - Monitor network bandwidth usage in real-time
- `Linux/check-dns-resolution.sh` - Check DNS resolution and performance
- `Linux/test-port-connectivity.sh` - Test connectivity to specific ports

## Usage

### Windows
```powershell
.\Network\Windows\Get-NetworkStatus.ps1
.\Network\Windows\Test-Connectivity.ps1
```

### Linux
```bash
chmod +x Network/Linux/*.sh
./Network/Linux/get-network-status.sh
./Network/Linux/test-connectivity.sh
./Network/Linux/monitor-bandwidth.sh
```

## Requirements

### PowerShell
- PowerShell 5.0+
- Administrator privileges

### Bash
- Bash 4.0+
- Common utilities: grep, awk, sed, ip, ping, nslookup
- Root/sudo access for some operations
