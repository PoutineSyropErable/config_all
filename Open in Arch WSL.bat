::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFD1GTQqBM2KpOpET6/326uSTsXE0V+0xa7PayLeGH+wa5FD8Sp8u2XQUkcgDbA==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
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
::Zh4grVQjdCyDJGyX8VAjFD1GTQqBM2KpOpET6/326uSTsXEuV/A2aJvI5pueJe5T40ukVIQu3jptq+dCCQNdHg==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
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
wt new-tab -p "{a5a97cb8-8961-5535-816d-772efe0c6a3f}" --startingDirectory "%DIR_PATH%" 
