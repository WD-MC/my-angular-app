@echo off
setlocal enabledelayedexpansion

:: Lire le PID depuis .pidfile
set /p pid=<.pidfile

:: Vérifier si le PID est valide
powershell -Command "
if (Get-Process -Id !pid! -ErrorAction SilentlyContinue) {
    Stop-Process -Id !pid!
    Write-Host 'Processus arrêté avec PID !pid!'
} else {
    Write-Host 'Aucun processus trouvé avec le PID !pid!'
}"