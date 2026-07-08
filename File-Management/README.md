# File Management Tools

File operations and management utilities for Windows and Linux platforms.

## Contents

### Windows (PowerShell)
- `Windows/Remove-OldFiles.ps1` - Remove files older than specified days
- `Windows/Archive-DirectoryFiles.ps1` - Archive files to zip
- `Windows/Backup-FilesByDate.ps1` - Backup files by date
- `Windows/Cleanup-TempFiles.ps1` - Clean temporary files

### Linux (Bash)
- `Linux/remove-old-files.sh` - Remove files older than specified days
- `Linux/backup-system.sh` - Create compressed backups of directories
- `Linux/find-duplicate-files.sh` - Find and remove duplicate files
- `Linux/cleanup-logs.sh` - Clean old log files
- `Linux/organize-by-extension.sh` - Organize files by extension

## Usage

### Windows
```powershell
.\File-Management\Windows\Remove-OldFiles.ps1 -Path C:\Temp -Days 30
.\File-Management\Windows\Backup-FilesByDate.ps1
```

### Linux
```bash
chmod +x File-Management/Linux/*.sh
./File-Management/Linux/remove-old-files.sh -p /tmp -d 30
./File-Management/Linux/backup-system.sh /home/user backup.tar.gz
```

## Requirements

### PowerShell
- PowerShell 5.0+

### Bash
- Bash 4.0+
- Common utilities: find, tar, gzip, md5sum
