@echo off
:menu
cls
echo 1. Launch dev tools
echo 2. Exit
set /p c=Choose:

if %c%==1 goto launch
if %c%==2 exit
goto menu

:launch
start "" code
start "" chrome
goto menu
