npm run ng build
:: Lancer 'ng serve' en arrière-plan et récupérer son PID
start /B npm run ng serve

:: Attendre quelques secondes pour que le processus soit bien lancé
timeout /t 1 > nul

:: Récupérer le PID du processus 'ng serve'
for /f "tokens=2" %%i in ('tasklist /fi "imagename eq node.exe" /fo csv ^| findstr /i "ng serve"') do set PID=%%i

:: Écrire le PID dans le fichier .pidfile
echo %PID% > .pidfile

:: Afficher un message pour l'utilisateur
echo 'Now...'
echo 'Visit http://localhost:4200 to see your Node.js/Angular application in action.'