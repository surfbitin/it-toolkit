# Remove-OldFiles.ps1
# Remove files older than specified days

param(
    [Parameter(Mandatory=$true)]
    [string]$Path,
    
    [int]$Days = 30,
    
    [switch]$WhatIf
)

if (-not (Test-Path $Path)) {
    Write-Error "Path not found: $Path"
    exit 1
}

$cutoffDate = (Get-Date).AddDays(-$Days)
$files = Get-ChildItem -Path $Path -File -Recurse | Where-Object {$_.LastWriteTime -lt $cutoffDate}

if ($files.Count -eq 0) {
    Write-Host "No files found older than $Days days"
    exit 0
}

Write-Host "Found $($files.Count) files to remove" -ForegroundColor Yellow
Write-Host ""

$totalSize = 0
foreach ($file in $files) {
    $totalSize += $file.Length
    if ($WhatIf) {
        Write-Host "Would delete: $($file.FullName) ($(([Math]::Round($file.Length / 1MB, 2))) MB)"
    } else {
        Write-Host "Deleting: $($file.FullName)"
        Remove-Item -Path $file.FullName -Force
    }
}

Write-Host ""
Write-Host "Total space that would be freed: $(([Math]::Round($totalSize / 1MB))) MB" -ForegroundColor Green
