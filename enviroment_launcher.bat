@echo off
REM this is a bat file to launch my coding enviroment

echo Welcome to the enviroment launcher

:start_script
echo -------------------------------------
echo What enviroment would you like to set up 
echo 1. Dev Mode (VS Code, Chrome, CMD)
echo 2. Animate Mode (Toon Boom, Obsidian, Pinterest)

set /p env=Choose: 
if /i "%env%"=="1" goto code
if /i "%env%"=="2" goto animate

echo Invalid Choice. Aight let's try again, enter 1 or 2 man. 
goto start_script


:code 
start chrome
start code
start cmd

goto end_script

:animate
start "" "C:\Program Files (x86)\Toon Boom Animation\Toon Boom Harmony 24 Premium\win64\bin\HarmonyPremium.exe"
start "" "C:\Users\Jaimz\AppData\Local\Programs\Obsidian\Obsidian.exe"
start "" "https://www.pinterest.com/"

goto end_script


:end_script
echo Environment setup complete.
pause
exit