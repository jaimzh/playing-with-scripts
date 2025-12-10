@echo off
REM a simple bat file to well backp a file at a specifc time or whatever 

set source= \text
set backup= \backup

rem this is some substring extraction stuff
set date= set today=%date:~-4%-%date:~4,2%-%date:~7,2% 

mkdir %backup%\%date%  /E /I /Y

rem e is to copy all subdirectories even empty ones, i is to create the directory if it doesn't exist, y is to suppress the prompt
