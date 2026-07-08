<#
.SYNOPSIS
    Backup files organized by date
.DESCRIPTION
    Creates a backup of files with date-stamped archive names
.PARAMETER SourcePath
    The directory to backup
.PARAMETER DestinationPath
    Where to store the backup
.EXAMPLE
    .\Backup-FilesByDate.ps1 -SourcePath C:\Documents -DestinationPath C:\Backups
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$SourcePath,
    
    [Parameter(Mandatory=$true)]
    [string]$DestinationPath
)

if (-not (Test-Path -Path $SourcePath)) {
    Write-Error "Source path does not exist: $SourcePath"
    exit 1
}

if (-not (Test-Path -Path $DestinationPath)) {
    New-Item -ItemType Directory -Path $DestinationPath -Force | Out-Null
}

$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$backupName = "backup_$timestamp.zip"
$backupPath = Join-Path $DestinationPath $backupName

try {
    Compress-Archive -Path $SourcePath -DestinationPath $backupPath -Force
    Write-Host "Backup created successfully: $backupPath"
}
catch {
    Write-Error "Backup failed: $_"
    exit 1
}
