<#
.SYNOPSIS
    Clean up temporary files from Windows temp directory
.DESCRIPTION
    Removes files from Windows temp directories to free up space
.PARAMETER Days
    Only delete files older than this many days (default: 7)
.EXAMPLE
    .\Cleanup-TempFiles.ps1 -Days 7
#>

param(
    [int]$Days = 7
)

$tempPaths = @(
    $env:TEMP,
    "C:\Windows\Temp"
)

$cutoffDate = (Get-Date).AddDays(-$Days)
$deletedCount = 0
$errorCount = 0

foreach ($tempPath in $tempPaths) {
    if (-not (Test-Path -Path $tempPath)) {
        Write-Host "Path does not exist: $tempPath"
        continue
    }
    
    Write-Host "Cleaning: $tempPath"
    
    $files = Get-ChildItem -Path $tempPath -File -Recurse -ErrorAction SilentlyContinue | 
             Where-Object { $_.LastWriteTime -lt $cutoffDate }
    
    foreach ($file in $files) {
        try {
            Remove-Item -Path $file.FullName -Force -ErrorAction Stop
            $deletedCount++
        }
        catch {
            $errorCount++
        }
    }
}

Write-Host "Cleanup complete! Deleted: $deletedCount files, Errors: $errorCount"
