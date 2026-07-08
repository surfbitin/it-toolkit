param(
    [string]$Path = "C:\"
)

function Get-DiskUsage {
    <#
    .SYNOPSIS
    Analyze disk usage by directory.
    
    .PARAMETER Path
    The path to analyze. Defaults to C:\
    #>
    
    if (-not (Test-Path $Path)) {
        Write-Host "[!] Path '$Path' not found" -ForegroundColor Red
        return
    }
    
    Write-Host "=== DISK USAGE ANALYSIS ==="
    Write-Host "Path: $Path" -ForegroundColor Cyan
    Write-Host ""
    
    try {
        Get-ChildItem -Path $Path -Directory -Force | ForEach-Object {
            $size = (Get-ChildItem $_.FullName -Recurse -Force -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum / 1MB
            
            $obj = [PSCustomObject]@{
                Name = $_.Name
                'Size (MB)' = [math]::Round($size, 2)
            }
            $obj
        } | Sort-Object 'Size (MB)' -Descending | Format-Table -AutoSize
        
    } catch {
        Write-Host "[!] Error: $_" -ForegroundColor Red
    }
}

Get-DiskUsage -Path $Path
