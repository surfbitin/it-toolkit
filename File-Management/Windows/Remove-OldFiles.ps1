<#
.SYNOPSIS
    Remove files older than a specified number of days
.DESCRIPTION
    Removes files in a specified directory that are older than the specified number of days
.PARAMETER Path
    The directory path to search for old files
.PARAMETER Days
    The age threshold in days
.EXAMPLE
    .\Remove-OldFiles.ps1 -Path C:\Temp -Days 30
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$Path,
    
    [Parameter(Mandatory=$true)]
    [int]$Days
)

if (-not (Test-Path -Path $Path)) {
    Write-Error "Path does not exist: $Path"
    exit 1
}

$cutoffDate = (Get-Date).AddDays(-$Days)
$files = Get-ChildItem -Path $Path -File -Recurse | Where-Object { $_.LastWriteTime -lt $cutoffDate }

if ($files.Count -eq 0) {
    Write-Host "No files found older than $Days days in $Path"
    exit 0
}

Write-Host "Found $($files.Count) files older than $Days days"

foreach ($file in $files) {
    try {
        Remove-Item -Path $file.FullName -Force
        Write-Host "Deleted: $($file.FullName)"
    }
    catch {
        Write-Error "Failed to delete $($file.FullName): $_"
    }
}

Write-Host "Cleanup complete!"
