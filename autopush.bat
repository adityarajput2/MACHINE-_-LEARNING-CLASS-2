@echo off
title Auto Git Push - MACHINE-_-LEARNING-CLASS-2
echo ===============================================
echo   Auto Git Push Active (Har 30 sec me check hoga)
echo   Window band karne par auto-push ruk jayega.
echo ===============================================

:loop
git status --porcelain | findstr . >nul
if %errorlevel% == 0 (
    echo Changes detect hue! GitHub par push kar rahe hain...
    git add .
    git commit -m "Auto sync: %date% %time%"
    git push origin main
    echo Push complete!
    echo.
)
timeout /t 30 /nobreak >nul
goto loop
