@echo off
REM Check if a directory path was provided
if "%~1"=="" (
    echo No directory specified.
    exit /b 1
)

REM Get the directory path
set "DIR_PATH=%~1"

REM Trim any trailing backslash from the directory path
if "%DIR_PATH:~-1%"=="\" set "DIR_PATH=%DIR_PATH:~0,-1%"

REM Launch Windows Terminal with Arch WSL in the specified profile and open the directory
wt new-tab -p "{701794fd-607c-5404-a93a-538ab1bd5727}" --startingDirectory "%DIR_PATH%" 
