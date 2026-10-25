# Auto Git Push Script for Windows PowerShell
param (
    [int]$IntervalSeconds = 10
)

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  Auto Git Push Active (Har $IntervalSeconds second me sync)" -ForegroundColor Green
Write-Host "  Branch: main | Repo: MACHINE-_-LEARNING-CLASS-2" -ForegroundColor DarkGray
Write-Host "  Koi bhi file change hote hi GitHub par auto-push hoga." -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Cyan

while ($true) {
    try {
        # Check if there are any changes (untracked, modified, deleted)
        $status = git status --porcelain
        if ($status) {
            $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
            Write-Host "[$timestamp] Changes detect hue! Auto-pushing..." -ForegroundColor Cyan
            git add -A
            git commit -m "Auto sync: $timestamp"
            git push origin main
            Write-Host "[$timestamp] GitHub successfully update ho gaya!`n" -ForegroundColor Green
        }
    } catch {
        Write-Warning "Sync error: $_"
    }
    Start-Sleep -Seconds $IntervalSeconds
}
