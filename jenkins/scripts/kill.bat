:: Lis le PID dans le fichier .pidfile
for /f "tokens=*" %%i in (.pidfile) do set PID=%%i

:: Vérifie si le PID est valide
if not "%PID%"=="" (
    :: Tuer le processus avec le PID
    taskkill /PID %PID% /F
    echo 'Process with PID %PID% has been killed.'
) else (
    echo 'No PID found. No process to kill.'
)
