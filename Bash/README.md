# Bash Tools

A comprehensive Bash toolkit for Linux system administration, diagnostics, and automation.

## Contents

### Network/
- `get-network-status.sh` - Display network interfaces and IP configuration
- `test-connectivity.sh` - Test connectivity to DNS, gateway, and internet

### System/
- `get-system-info.sh` - Display comprehensive system information
- `get-disk-usage.sh` - Analyze disk usage by directory
- `monitor-processes.sh` - Monitor running processes by CPU and memory

### Security/
- `check-security-status.sh` - Check SELinux, AppArmor, firewall, and SSH configuration

### FileManagement/
- `remove-old-files.sh` - Remove files older than specified days

### Monitoring/
- `monitor-performance.sh` - Real-time system performance monitoring
- `generate-diagnostics.sh` - Generate comprehensive system diagnostic report

### Utilities/
- `backup-system.sh` - Create compressed backups of directories

## Usage

Make scripts executable:
```bash
chmod +x Bash/**/*.sh
```

Run a script:
```bash
./Bash/System/get-system-info.sh
```

Run with parameters:
```bash
./Bash/FileManagement/remove-old-files.sh -p /tmp -d 30
```

## Requirements

- Bash 4.0+
- Common Linux utilities (grep, awk, sed, etc.)
- Root/sudo access for some operations
- systemd (for some monitoring scripts)

## Supported Distributions

- Ubuntu/Debian
- CentOS/RHEL
- Fedora
- Alpine
- Arch Linux

## License

MIT
