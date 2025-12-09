@echo off

rem so i am gonna make some kind of story let's go 
cls 
color 0A
:chapter1
echo This is the begining of the teleporter he likes to talk and teleport, he doesn't really finish his sentences mid sentences so he always pauses and teleports
echo just like this 
echo " heloo there viewer my name is"
pause
goto intro

:intro
echo "The teleporter and i am about to "
pause
goto teleport

:teleport
echo teleport again haha 

:option
set /p input= do you want to end this story?  
if "%input%"=="yes" (
    goto exit
) else if "%input%"=="no" (
    goto chapter1
)

:exit 
exit
