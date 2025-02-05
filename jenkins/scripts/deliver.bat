:: Lance le build Angular
npm run ng build

:: Lance le serveur Angular en arrière-plan
start /B npm run ng serve

:: Récupère le PID du processus 'ng serve'
for /f "tokens=2" %%i in ('tasklist /fi "imagename eq node.exe" /fo csv ^| findstr "ng serve"') do set PID=%%i

:: Enregistre le PID dans le fichier .pidfile
echo %PID% > .pidfile

:: Affiche un message indiquant que l'application est prête
echo 'Now...'
echo 'Visit http://localhost:4200 to see your Node.js/Angular application in action.'