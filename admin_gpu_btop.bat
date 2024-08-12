@echo off
:: Run Windows Terminal with PowerShell as admin and execute btop

:: Set the GUID of the PowerShell profile in Windows Terminal
set powershell_guid={61c54bbd-c2c6-5271-96e7-009a87ff44bf}

:: Run Windows Terminal with the specified PowerShell profile in admin mode and execute btop
wt.exe -p %powershell_guid% --title "btop" powershell -Command "Start-Process powershell -Verb RunAs -ArgumentList 'btop'"

