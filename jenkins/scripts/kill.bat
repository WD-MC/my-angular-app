@echo off
rem Lecture du PID depuis le fichier .pidfile
set /p PID=<.pidfile

rem Vérification de l'existence du processus
tasklist /FI "PID eq %PID%" 2>NUL | find /I "%PID%" >NUL
if "%ERRORLEVEL%"=="0" (
    echo 'Le processus %PID% existe. Terminaison du processus...'
    taskkill /F /PID %PID%
) else (
    echo 'Le processus' %PID% 'n'existe pas.'
)
