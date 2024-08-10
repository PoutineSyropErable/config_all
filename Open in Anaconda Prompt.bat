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
wt new-tab -p "{6f30ad27-0dbb-430b-a26b-1a95e5ecdee5}" --startingDirectory "%DIR_PATH%" 
