# Auto Git Push Script for Windows PowerShell
param (
    [int]$IntervalSeconds = 30
)

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  Auto Git Push Active (Interval: $IntervalSeconds sec)" -ForegroundColor Green
Write-Host "  Branch: main | Repo: MACHINE-_-LEARNING-CLASS-2" -ForegroundColor DarkGray
Write-Host "  Press Ctrl+C to stop anytime." -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Cyan

while ($true) {
    # Check if there are changes (untracked, modified, deleted)
    $status = git status --porcelain
    if ($status) {
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Write-Host "[$timestamp] Changes detect hue! GitHub par push ho raha hai..." -ForegroundColor Cyan
        git add .
        git commit -m "Auto sync: $timestamp"
        git push origin main
        Write-Host "[$timestamp] Push complete ho gaya! `n" -ForegroundColor Green
    }
    Start-Sleep -Seconds $IntervalSeconds
}
