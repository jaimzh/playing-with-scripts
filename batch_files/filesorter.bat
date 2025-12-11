@echo off
REM this is is a file sorter and i am gonna use this to sort files and test them 
cls
mkdir image-folder video-folder audio-folder docs-folder

for %%i in (*.jpg *png) do (
    move %%i image-folder
)

for %%i in (*.mp4 *mkv) do (
    move %%i video-folder
)

for %%i in (*.mp3 *wav) do (
    move %%i audio-folder
)

for %%i in (*.pdf *doc *docx) do (
    move %%i docs-folder
)

echo file sorted mannnnn
