# IT Toolkit

A comprehensive toolkit for IT administration, system management, and automation across Windows and Linux platforms. Scripts are organized by function category with platform-specific implementations.

## Repository Structure

```
it-toolkit/
├── Network/                 # Network diagnostics and utilities
│   ├── Windows/            # PowerShell network scripts
│   └── Linux/              # Bash network scripts
│
├── Security/               # Security scanning and hardening
│   ├── Windows/            # PowerShell security scripts
│   └── Linux/              # Bash security scripts
│
├── System/                 # System information and maintenance
│   ├── Windows/            # PowerShell system scripts
│   └── Linux/              # Bash system scripts
│
├── File-Management/        # File operations and cleanup
│   ├── Windows/            # PowerShell file management scripts
│   └── Linux/              # Bash file management scripts
│
├── Utilities/              # General purpose helper functions
│   ├── Windows/            # PowerShell utilities
│   └── Linux/              # Bash utilities
│
and README.md files in each category
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

# Manage files
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

# Manage files
./File-Management/Linux/remove-old-files.sh -p /tmp -d 30
```

## Features

### Network Tools
- Network diagnostics and connectivity testing
- DNS resolution checking
- Port connectivity testing
- Bandwidth monitoring

### System Management
- System information and resource monitoring
- Disk usage analysis
- Process monitoring
- System health checks

### Security
- Security scanning and hardening
- Firewall status checks
- SSH configuration auditing
- Permission auditing

### File Management
- Old file removal and cleanup
- Backup and archive utilities
- Duplicate file detection
- Log file cleanup

### Utilities
- System diagnostics and reporting
- Health checks
- Performance optimization
- Service management

## Requirements

### PowerShell Scripts
- PowerShell 5.0 or higher (or PowerShell Core)
- Administrator privileges for most scripts
- Windows 10/11 or Windows Server 2016+

### Bash Scripts
- Bash 4.0+
- Common Linux utilities (grep, awk, sed, etc.)
- Root/sudo access for some operations
- Supported distributions: Ubuntu/Debian, CentOS/RHEL, Fedora, Alpine, Arch Linux

## Usage

All scripts are organized by category with platform-specific subdirectories. You can run them directly or import them as modules in your shell profile.

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

## Contributing

Contributions welcome! Please ensure:
- Scripts are well-commented
- Both PowerShell and Bash versions are provided for new tools
- Add appropriate README entries in category folders
- Test scripts thoroughly before submitting

## License

MIT
