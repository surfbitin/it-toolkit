<#
.SYNOPSIS
    Analyze disk usage by directory
.DESCRIPTION
    Shows disk usage for top-level directories
.PARAMETER Path
    Starting path for analysis (default: C:\)
.PARAMETER TopCount
    Number of top directories to show (default: 10)
.EXAMPLE
    .\Get-DiskUsage.ps1 -Path "C:\" -TopCount 20
#>

param(
    [string]$Path = "C:\",
    [int]$TopCount = 10
)

Write-Host "Analyzing disk usage in $Path..." -ForegroundColor Cyan

$directories = Get-ChildItem -Path $Path -Directory -ErrorAction SilentlyContinue
$results = @()

foreach ($dir in $directories) {
    try {
        $size = (Get-ChildItem -Path $dir.FullName -Recurse -File -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum
        $results += [PSCustomObject]@{
            Name = $dir.Name
            Size_MB = [math]::Round($size/1MB, 2)
            Size_GB = [math]::Round($size/1GB, 2)
        }
    } catch {}
}

$results | Sort-Object Size_GB -Descending | Select-Object -First $TopCount | Format-Table -AutoSize