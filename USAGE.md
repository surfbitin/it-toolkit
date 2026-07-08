# How to Use IT Toolkit

A quick reference guide for using the IT Toolkit scripts.

## Quick Start

### Windows (PowerShell)

1. **Open PowerShell as Administrator**
2. **Navigate to your toolkit folder:**
   ```powershell
   cd C:\path\to\it-toolkit
   ```

3. **Run scripts directly:**
   ```powershell
   # Get system info
   .\System\Windows\Get-SystemInfo.ps1
   
   # Test network connectivity
   .\Network\Windows\Test-Connectivity.ps1
   
   # Remove old files (older than 30 days)
   .\File-Management\Windows\Remove-OldFiles.ps1 -Path C:\Temp -Days 30
   
   # Create a backup
   .\File-Management\Windows\Backup-FilesByDate.ps1 -SourcePath C:\Documents -DestinationPath C:\Backups
   
   # Clean temp files
   .\File-Management\Windows\Cleanup-TempFiles.ps1 -Days 7
   
   # Check security status
   .\Security\Windows\Check-SecureBootStatus.ps1
   ```

### Linux (Bash)

1. **Open Terminal**
2. **Navigate to your toolkit folder:**
   ```bash
   cd /path/to/it-toolkit
   ```

3. **Make scripts executable (first time only):**
   ```bash
   chmod +x **/*.sh
   ```

4. **Run scripts:**
   ```bash
   # Get system info
   ./System/Linux/get-system-info.sh
   
   # Test network connectivity
   ./Network/Linux/test-connectivity.sh
   
   # Remove old files
   ./File-Management/Linux/remove-old-files.sh -p /tmp -d 30
   
   # Create a backup
   ./File-Management/Linux/backup-system.sh /home/user backup.tar.gz
   
   # Find duplicate files
   ./File-Management/Linux/find-duplicate-files.sh /path/to/search
   
   # Clean logs older than 30 days
   ./File-Management/Linux/cleanup-logs.sh -p /var/log -d 30
   
   # Check security status
   sudo ./Security/Linux/check-security-status.sh
   
   # System health check
   ./Utilities/Linux/system-health-check.sh
   ```

## Common Use Cases

### Maintenance

**Windows - Clean temp files:**
```powershell
.\File-Management\Windows\Cleanup-TempFiles.ps1 -Days 7
```

**Linux - Remove old files:**
```bash
# Remove files older than 60 days from Downloads
./File-Management/Linux/remove-old-files.sh -p ~/Downloads -d 60

# Clean old logs
./File-Management/Linux/cleanup-logs.sh -p /var/log -d 90
```

### Backup

**Windows:**
```powershell
.\File-Management\Windows\Backup-FilesByDate.ps1 -SourcePath C:\Documents -DestinationPath C:\Backups
```

**Linux:**
```bash
# Backup important directory
./File-Management/Linux/backup-system.sh /home/user/documents daily-backup.tar.gz
```

### Diagnostics

**Windows:**
```powershell
.\System\Windows\Get-SystemInfo.ps1
.\Network\Windows\Get-NetworkStatus.ps1
.\Security\Windows\Check-SecureBootStatus.ps1
```

**Linux:**
```bash
# Check system health
./Utilities/Linux/system-health-check.sh

# Get network status
./Network/Linux/get-network-status.sh

# Monitor bandwidth
./Network/Linux/monitor-bandwidth.sh

# Generate diagnostics report
./Utilities/Linux/generate-diagnostics.sh
```

### Find & Organize Files

**Linux - Find duplicates:**
```bash
./File-Management/Linux/find-duplicate-files.sh /path/to/search
```

**Linux - Organize files by extension:**
```bash
./File-Management/Linux/organize-by-extension.sh /path/to/organize
```

## Automation

### Windows Task Scheduler

1. Open **Task Scheduler**
2. Create a new task
3. Set trigger (daily, weekly, etc.)
4. Set action to run PowerShell script:
   ```
   powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\path\to\it-toolkit\File-Management\Windows\Cleanup-TempFiles.ps1" -Days 7
   ```

### Linux Cron Jobs

Add to crontab with `crontab -e`:

```bash
# Run cleanup daily at 2 AM
0 2 * * * /path/to/it-toolkit/File-Management/Linux/cleanup-logs.sh -p /var/log -d 30

# Run system health check every Sunday at 3 AM
0 3 * * 0 /path/to/it-toolkit/Utilities/Linux/system-health-check.sh

# Create weekly backup
0 4 * * 1 /path/to/it-toolkit/File-Management/Linux/backup-system.sh /home/user weekly-backup.tar.gz
```

## Script Parameters

### Common Flags

Most scripts support these options:

- `-h` or `--help` - Display help information
- `-p` or `--path` - Specify directory path
- `-d` or `--days` - Specify number of days

### File Management Scripts

**Remove-OldFiles.ps1**
```powershell
-Path <path>      # Directory to clean
-Days <number>    # Age threshold in days
```

**Backup-FilesByDate.ps1**
```powershell
-SourcePath <path>           # Directory to backup
-DestinationPath <path>      # Where to store backup
```

**Cleanup-TempFiles.ps1**
```powershell
-Days <number>    # Only delete files older than this many days (default: 7)
```

**remove-old-files.sh**
```bash
-p <path>   # Directory to clean
-d <days>   # Age threshold in days
```

**cleanup-logs.sh**
```bash
-p <path>   # Directory containing logs
-d <days>   # Only delete logs older than this many days
```

## Best Practices

1. **Always review scripts before running** - Especially those requiring elevated privileges
2. **Make scripts executable** - `chmod +x script.sh` on Linux
3. **Run in test environment first** - Before deploying to production systems
4. **Keep scripts updated** - Check for improvements and security patches
5. **Use with caution on production systems** - Test destructive operations carefully
6. **Run with appropriate privileges:**
   - Windows: Most scripts require Administrator
   - Linux: Use `sudo` for operations requiring root access
7. **Backup before destructive operations** - Remove/cleanup scripts are permanent
8. **Schedule tasks carefully** - Don't run conflicting tasks at the same time

## Troubleshooting

### PowerShell Execution Policy Error

If you get an execution policy error, run:
```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser
```

### Linux Permission Denied

If scripts won't run, make them executable:
```bash
chmod +x Script-Name.sh
```

### Script Not Found

Make sure you're in the correct directory:
```bash
pwd  # Check current directory
ls   # List files to verify script exists
```

## Getting Help

For detailed information about each category:
- [Network Tools](./Network/README.md)
- [Security Tools](./Security/README.md)
- [System Tools](./System/README.md)
- [File Management](./File-Management/README.md)
- [Utilities](./Utilities/README.md)

Each README has specific usage examples and requirements for that category.
