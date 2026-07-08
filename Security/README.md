# Security Tools

Security scanning and hardening utilities for Windows and Linux platforms.

## Contents

### Windows (PowerShell)
- `Windows/Check-SecureBootStatus.ps1` - Check SecureBoot and UEFI settings
- `Windows/Get-SecurityStatus.ps1` - Get comprehensive security status
- `Windows/Check-WindowsDefender.ps1` - Check Windows Defender status
- `Windows/Audit-UserAccounts.ps1` - Audit local user accounts and permissions

### Linux (Bash)
- `Linux/check-security-status.sh` - Check SELinux, AppArmor, firewall, and SSH configuration
- `Linux/audit-open-ports.sh` - Audit open ports and listening services
- `Linux/check-file-permissions.sh` - Check file and directory permissions
- `Linux/audit-sudo-usage.sh` - Audit sudo access and usage
- `Linux/check-firewall-status.sh` - Check firewall rules and status

## Usage

### Windows
```powershell
.\Security\Windows\Check-SecureBootStatus.ps1
.\Security\Windows\Get-SecurityStatus.ps1
```

### Linux
```bash
chmod +x Security/Linux/*.sh
sudo ./Security/Linux/check-security-status.sh
./Security/Linux/check-firewall-status.sh
```

## Requirements

### PowerShell
- PowerShell 5.0+
- Administrator privileges

### Bash
- Bash 4.0+
- Root/sudo access for most operations
