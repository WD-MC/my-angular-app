npm run ng build
npm run ng serve &
sleep 1
:: Récupérer le PID du processus 'ng serve'
for /f "tokens=2" %%i in ('tasklist /fi "imagename eq node.exe" /fo csv ^| findstr /i "ng serve"') do set PID=%%i

:: Écrire le PID dans le fichier .pidfile
echo %PID% > .pidfile

echo 'Now...'
echo 'Visit http://localhost:4200 to see your Node.js/Angular application in action.'