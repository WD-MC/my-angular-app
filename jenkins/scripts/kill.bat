@echo off
setlocal enabledelayedexpansion

:: Vérifiez si le fichier .pidfile existe
if exist .pidfile (
    :: Lire le PID depuis .pidfile
    set /p pid=<.pidfile

    :: Vérifiez si le PID est valide (existe et est un entier)
    for /f "delims=" %%i in ('tasklist /FI "PID eq !pid!" 2^>nul') do (
        set "line=%%i"
    )

    :: Si une ligne est trouvée (le processus existe), alors tuer le processus
    if defined line (
        echo 'Le processus avec PID !pid! est en cours d'exécution, tentative d'arrêt...'
        taskkill /PID !pid! /F
        echo 'Processus avec PID !pid! arrêté.'
    ) else (
        echo 'Aucune application trouvée avec le PID !pid!.'
    )
) else (
    echo 'Le fichier .pidfile n'existe pas ou est vide.'
)

endlocal
