<#
.SYNOPSIS
    Remove files older than specified days
.DESCRIPTION
    Safely removes files older than specified number of days from a directory
.PARAMETER Path
    Directory path to clean
.PARAMETER Days
    Age threshold in days (default: 30)
.PARAMETER Filter
    File pattern to match (default: *.*)
.EXAMPLE
    .\Remove-OldFiles.ps1 -Path "C:\Temp" -Days 30
    .\Remove-OldFiles.ps1 -Path "D:\Logs" -Days 90 -Filter "*.log"
#>

param(
    [Parameter(Mandatory=$true)][string]$Path,
    [int]$Days = 30,
    [string]$Filter = "*.*"
)

if (-not (Test-Path $Path)) {
    Write-Host "Error: Path '$Path' does not exist" -ForegroundColor Red
    exit
}

$cutoffDate = (Get-Date).AddDays(-$Days)
$files = Get-ChildItem -Path $Path -Filter $Filter -File -Recurse | Where-Object {$_.LastWriteTime -lt $cutoffDate}

if ($files.Count -eq 0) {
    Write-Host "No files found older than $Days days matching filter '$Filter'" -ForegroundColor Green
    exit
}

Write-Host "Found $($files.Count) file(s) to remove:" -ForegroundColor Yellow
$files | Format-Table Name, LastWriteTime, @{N="Size(MB)";E={[math]::Round($_.Length/1MB,2)}}

$confirm = Read-Host "`nAre you sure you want to delete these files? (yes/no)"
if ($confirm -eq "yes") {
    $files | Remove-Item -Force -ErrorAction SilentlyContinue
    Write-Host "Files deleted successfully" -ForegroundColor Green
} else {
    Write-Host "Operation cancelled" -ForegroundColor Yellow
}