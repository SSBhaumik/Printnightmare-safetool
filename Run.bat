@echo off
@echo KINDLY GRANT ADMIN PRIVILEGE TO CONTINUE
@echo Windows PrintNightmare vulnerability mitigation tool.
@echo A tool to start or stop print spooler service with ease for immediate patchwork on system flaw. 
@echo Keep spooler service "ON" during use only.
@echo "DISABLE" service startup. 
@echo CODE BY SRINATH S BHAUMIK
@echo #fightcovid19 
:: BatchGotAdmin
::-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
CLS
::--------------------------------------
@echo Windows PrintNightmare vulnerability mitigation tool.
@echo A tool to start or stop print spooler service with ease for immediate workaround on system flaw. 
@echo Keep spooler service "ON" during use only. 
@echo "DISABLE" service startup.
@echo CODE BY SRINATH S BHAUMIK
@echo #fightcovid19 
:start
@echo ENTER YOUR CHOICE IN NUMBER THEN PRESS RETURN.
@echo 1 TO ACTIVATE PRINT SPOOLER.
@echo 2 TO DEACTIVATE PRINT SPOOLER.
@echo 3 TO DISABLE SERVICE STARTUP.
@echo 4 TO ENABLE SERVICE STARTUP. 
@echo 5 TO EXIT SCRIPT.
set choice=
set /p choice=  
if '%choice%'=='1' goto spoolstart
if '%choice%'=='2' goto spoolpurge
if '%choice%'=='5' goto quit
if '%choice%'=='3' goto wnsh
if '%choice%'=='4' goto wnss
ECHO "%choice%" is not valid, try again
goto start
:spoolpurge
PowerShell.exe -Command "& {Start-Process PowerShell.exe -ArgumentList '-ExecutionPolicy Bypass -File ""stop.ps1""' -Verb RunAs}"
pause
goto start
:spoolstart
PowerShell.exe -Command "& {Start-Process PowerShell.exe -ArgumentList '-ExecutionPolicy Bypass -File ""start.ps1""' -Verb RunAs}"
pause
goto start
:wnsh
PowerShell.exe -Command "& {Start-Process PowerShell.exe -ArgumentList '-ExecutionPolicy Bypass -File ""spoolstartup0.ps1""' -Verb RunAs}"
pause
goto start
:wnss
PowerShell.exe -Command "& {Start-Process PowerShell.exe -ArgumentList '-ExecutionPolicy Bypass -File ""spoolstartup1.ps1""' -Verb RunAs}"
pause
goto start
:quit
exit
