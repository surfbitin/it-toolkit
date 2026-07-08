# IT Toolkit

A comprehensive toolkit for IT administration, system management, and automation across Windows and Linux platforms.

## Repository Structure

```
it-toolkit/
├── PowerShell/              # Windows PowerShell Scripts
│   ├── Security/            # Security scanning and hardening
│   ├── System/              # System information and maintenance
│   ├── Network/             # Network diagnostics and utilities
│   ├── FileManagement/      # File operations and cleanup
│   ├── Utilities/           # General purpose helpers
│   └── Monitors/            # System monitoring scripts
│
├── Bash/                    # Linux Bash Scripts
│   ├── Security/            # Security checks and hardening
│   ├── System/              # System information and maintenance
│   ├── Network/             # Network diagnostics and utilities
│   ├── FileManagement/      # File operations and cleanup
│   ├── Monitoring/          # Performance and health monitoring
│   └── Utilities/           # General purpose helpers
│
└── docs/                    # Documentation
```

## Quick Start

### Windows (PowerShell)

```powershell
# Get system information
.\PowerShell\System\Get-SystemInfo.ps1

# Test network connectivity
.\PowerShell\Network\Test-Connectivity.ps1

# Check security status
.\PowerShell\Security\Check-SecureBootStatus.ps1
```

### Linux (Bash)

```bash
# Make scripts executable
chmod +x Bash/**/*.sh

# Get system information
./Bash/System/get-system-info.sh

# Test network connectivity
./Bash/Network/test-connectivity.sh

# Check security status
./Bash/Security/check-security-status.sh
```

## Features

- **Network Tools** - Network diagnostics and utilities
- **System Management** - System information, updates, and maintenance
- **Security** - Security scanning and hardening scripts
- **File Management** - File operations and cleanup utilities
- **Monitoring** - System monitoring and health checks
- **Utilities** - General purpose helper functions

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

All scripts are located in their respective platform and category folders. You can run them directly or import them as modules in your shell profile.

For detailed information about each script, see the README.md files in the respective directories:
- [PowerShell Scripts](./PowerShell/README.md)
- [Bash Scripts](./Bash/README.md)

## License

MIT
