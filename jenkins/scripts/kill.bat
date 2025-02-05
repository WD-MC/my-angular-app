@echo off
set /p pid=<.pidfile
echo PID récupéré: %pid%

taskkill /PID %pid% /F