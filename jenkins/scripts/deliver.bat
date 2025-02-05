@echo off
rem Construction de l'application Angular
npm run build

rem Lancement du serveur Angular
start "" "cmd /c npm run serve"
timeout /t 1 >nul

rem Obtention du PID du processus Angular
for /f "tokens=2" %%i in ('tasklist /fi "imagename eq node.exe" /fo csv /nh') do (
    echo %%i > .pidfile
)

echo 'Now...'
echo 'Visit http://localhost:4200 to see your Node.js/Angular application in action.'
