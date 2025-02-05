for /f "tokens=*" %%i in (.pidfile) do set PID=%%i
taskkill /PID %PID% /F 