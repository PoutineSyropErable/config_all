
$registryPath = "HKCR\Directory\Background\shell\OpenPowershellAdmin"
$command = "C:\Users\Francois\Documents\Scripts\Open in Powershell (Admin).bat"

# Create the registry key for the context menu entry
New-Item -Path $registryPath -Force | Out-Null
Set-ItemProperty -Path $registryPath -Name "MUIVerb" -Value "Open Powershell (Admin)"
Set-ItemProperty -Path $registryPath -Name "Icon" -Value "%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe"
Set-ItemProperty -Path $registryPath -Name "Position" -Value "Top"

# Create the command subkey and set the command to execute the batch file
$commandPath = "$registryPath\command"
New-Item -Path $commandPath -Force | Out-Null
Set-ItemProperty -Path $commandPath -Name "(default)" -Value "`"$command`" `"%V`""
