@echo off
set /p pid=<.pidfile
echo PID récupéré: %pid%

:: Vérification si le PID est valide
tasklist /fi "PID eq %pid%" | findstr %pid% > nul
if errorlevel 1 (
    echo 'Le processus avec le PID %pid% n'existe pas ou a déjà été terminé.'
    exit /b 1
)

taskkill /PID %pid% /F
echo 'Processus avec le PID' %pid% 'arrêté.'