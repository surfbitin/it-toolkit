# Get-DiskUsage.ps1
# Analyze disk usage by drive

param(
    [string]$Drive = "C:",
    [int]$TopN = 10
)

Write-Host "Disk Usage Analysis - $Drive" -ForegroundColor Green
Write-Host "========================" -ForegroundColor Green
Write-Host ""

$driveInfo = Get-Volume -DriveLetter $Drive.TrimEnd(":")
Write-Host "Total Size: $(([Math]::Round($driveInfo.Size / 1GB))) GB"
Write-Host "Used Space: $(([Math]::Round(($driveInfo.Size - $driveInfo.SizeRemaining) / 1GB))) GB"
Write-Host "Free Space: $(([Math]::Round($driveInfo.SizeRemaining / 1GB))) GB"
$percentFree = ($driveInfo.SizeRemaining / $driveInfo.Size) * 100
Write-Host "Percent Free: $([Math]::Round($percentFree))%"
Write-Host ""

Write-Host "Top $TopN Directories by Size:" -ForegroundColor Yellow
$path = "$Drive\\*"
Get-ChildItem -Path $path -Directory -ErrorAction SilentlyContinue |
    ForEach-Object {
        $size = (Get-ChildItem -Path $_.FullName -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum / 1MB
        [PSCustomObject]@{
            Name = $_.Name
            Size_MB = [Math]::Round($size, 2)
        }
    } |
    Sort-Object Size_MB -Descending |
    Select-Object -First $TopN |
    Format-Table -AutoSize
