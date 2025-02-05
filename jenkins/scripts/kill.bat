@echo off
set /p PID=<.pidfile
taskkill /F /PID %PID%