param(
    [string]$Path = "$env:TEMP",
    [int]$Days = 30,
    [switch]$WhatIf
)

function Remove-OldFiles {
    <#
    .SYNOPSIS
    Remove files older than specified days.
    
    .PARAMETER Path
    The directory to clean. Defaults to TEMP.
    
    .PARAMETER Days
    Number of days to keep. Defaults to 30.
    
    .PARAMETER WhatIf
    Show what would be deleted without actually deleting.
    #>
    
    if (-not (Test-Path $Path)) {
        Write-Host "[!] Path '$Path' not found" -ForegroundColor Red
        return
    }
    
    $cutoffDate = (Get-Date).AddDays(-$Days)
    $oldFiles = Get-ChildItem -Path $Path -Recurse -File -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -lt $cutoffDate }
    
    if ($oldFiles.Count -eq 0) {
        Write-Host "No old files found." -ForegroundColor Green
        return
    }
    
    Write-Host "Found $($oldFiles.Count) files older than $Days days" -ForegroundColor Cyan
    
    if ($WhatIf) {
        Write-Host "[WhatIf] Would delete:" -ForegroundColor Yellow
        $oldFiles | ForEach-Object { Write-Host "  $($_.FullName)" }
    } else {
        $oldFiles | Remove-Item -Force -ErrorAction SilentlyContinue
        Write-Host "[✓] Deleted $($oldFiles.Count) old files" -ForegroundColor Green
    }
}

Remove-OldFiles -Path $Path -Days $Days -WhatIf:$WhatIf
