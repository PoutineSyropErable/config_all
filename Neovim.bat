::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFD1GTQqBM2KpOpET6/326uSTsXE0V+0xa7PV37uYKe0s40bre9gk1XU6
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSzk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFD1GTQqBM2KpOpET6/326uSTsXE0V+0xa7P137uYKe1d713hFQ==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
REM Check if a file path was provided
if "%~1"=="" (
    echo No file specified.
    exit /b 1
)

REM Get the directory of the specified file
set "FILE_PATH=%~1"
set "FILE_DIR=%~dp1"

REM Trim any trailing backslash from the directory path
if "%FILE_DIR:~-1%"=="\" set "FILE_DIR=%FILE_DIR:~0,-1%"

REM Launch Windows Terminal with Neovim in the specified profile and open the file



REM Neovim
wt new-tab -p "{de998ae3-db89-4313-882d-2c4b90413ba4}" --startingDirectory "%FILE_DIR%" nvim "%FILE_PATH%"
