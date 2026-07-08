# IT Toolkit

A comprehensive toolkit for IT administration, system management, and automation across Windows and Linux platforms. Scripts are organized by function category with platform-specific implementations.

## Repository Structure

```
it-toolkit/
├── Network/                 # Network diagnostics and utilities
│   ├── Windows/            # PowerShell network scripts
│   ├── Linux/              # Bash network scripts
│   └── README.md
│
├── Security/               # Security scanning and hardening
│   ├── Windows/            # PowerShell security scripts
│   ├── Linux/              # Bash security scripts
│   └── README.md
│
├── System/                 # System information and maintenance
│   ├── Windows/            # PowerShell system scripts
│   ├── Linux/              # Bash system scripts
│   └── README.md
│
├── File-Management/        # File operations and cleanup
│   ├── Windows/            # PowerShell file management scripts
│   ├── Linux/              # Bash file management scripts
│   └── README.md
│
├── Utilities/              # General purpose helper functions
│   ├── Windows/            # PowerShell utilities
│   ├── Linux/              # Bash utilities
│   └── README.md
│
├── README.md              # This file
└── .gitignore
```

## Quick Start

### Windows (PowerShell)

```powershell
# Get system information
.\System\Windows\Get-SystemInfo.ps1

# Test network connectivity
.\Network\Windows\Test-Connectivity.ps1

# Check security status
.\Security\Windows\Check-SecureBootStatus.ps1

# Remove old files
.\File-Management\Windows\Remove-OldFiles.ps1 -Path C:\Temp -Days 30
```

### Linux (Bash)

```bash
# Make scripts executable
chmod +x **/*.sh

# Get system information
./System/Linux/get-system-info.sh

# Test network connectivity
./Network/Linux/test-connectivity.sh

# Check security status
sudo ./Security/Linux/check-security-status.sh

# Remove old files
./File-Management/Linux/remove-old-files.sh -p /tmp -d 30
```

## Features

### Network Tools
- Network diagnostics and connectivity testing
- DNS resolution checking
- Port connectivity testing

### System Management
- System information and resource monitoring
- Disk usage analysis
- Process monitoring

### Security
- Security scanning and hardening
- SecureBoot and UEFI checking
- SSH configuration auditing

### File Management
- Old file removal and cleanup
- Backup and archive utilities
- Duplicate file detection
- Log file cleanup
- File organization by extension

### Utilities
- System diagnostics and reporting
- Health checks
- Profile management

## Requirements

### PowerShell Scripts
- PowerShell 5.0 or higher (or PowerShell Core)
- Administrator privileges for most scripts
- Windows 10/11 or Windows Server 2016+

### Bash Scripts
- Bash 4.0+
- Common Linux utilities (grep, awk, sed, find, tar, etc.)
- Root/sudo access for some operations
- Supported distributions: Ubuntu/Debian, CentOS/RHEL, Fedora, Alpine, Arch Linux

## Usage

All scripts are organized by category with platform-specific subdirectories (Windows/ and Linux/).

For detailed information about each category:
- [Network Tools](./Network/README.md)
- [Security Tools](./Security/README.md)
- [System Tools](./System/README.md)
- [File Management](./File-Management/README.md)
- [Utilities](./Utilities/README.md)

## Best Practices

1. **Always review scripts before running** - Especially those requiring elevated privileges
2. **Make scripts executable** - `chmod +x script.sh` on Linux
3. **Run in test environment first** - Before deploying to production systems
4. **Keep scripts updated** - Check for improvements and security patches
5. **Use with caution on production systems** - Test destructive operations carefully
6. **Check script parameters** - Review available options with `-h` or `-help` flag

## Contributing

Contributions welcome! Please ensure:
- Scripts are well-commented
- Both PowerShell and Bash versions are provided for new tools
- Add appropriate README entries in category folders
- Test scripts thoroughly before submitting
- Follow the folder structure: `Category/Windows/` or `Category/Linux/`

## License

MIT
