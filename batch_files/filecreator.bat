@echo off 
REM this is a bat file to make jpg png mp4 mp3 wav pdf doc docx files

for %%f in (jpg png mp4 mp3 wav pdf doc docx) do (
    type nul > filename.%%f
)

echo this actually ran crazyyyy