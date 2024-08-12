
# Define the path to VSCode executable
$vsCodePath = "C:\Users\Francois\AppData\Local\Programs\Microsoft VS Code\Code.exe"

# Define the registry key paths
$baseKeyPath = "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\Open with VSCode"
$commandKeyPath = "$baseKeyPath\command"

# Create the base key
New-Item -Path $baseKeyPath -Force | Out-Null
Set-ItemProperty -Path $baseKeyPath -Name "(Default)" -Value "Open with VSCode"

# Set the icon (Optional)
Set-ItemProperty -Path $baseKeyPath -Name "Icon" -Value "$vsCodePath"

# Create the command key
New-Item -Path $commandKeyPath -Force | Out-Null
Set-ItemProperty -Path $commandKeyPath -Name "(Default)" -Value "`"$vsCodePath`" `"%V`""

Write-Output "Context menu entry 'Open with VSCode' added successfully."
