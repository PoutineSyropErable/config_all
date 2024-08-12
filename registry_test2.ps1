
# Define the registry paths
$keyPath = "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\Arch WSL 2"
$commandKeyPath = "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\Arch WSL 2\command"

# Create the main registry key
if (-not (Test-Path $keyPath)) {
    New-Item -Path $keyPath -Force
    Write-Output "Created registry key: $keyPath"
} else {
    Write-Output "Registry key already exists: $keyPath"
}

# Set the default value for the main key
New-ItemProperty -Path $keyPath -Name "(Default)" -Value "Open in Arch WSL 2" -PropertyType String -Force
Write-Output "Set default value for $keyPath"

# Set the Icon value for the main key
New-ItemProperty -Path $keyPath -Name "Icon" -Value "C:\Users\Francois\Documents\Icons\arch_linux_icon.ico" -PropertyType String -Force
Write-Output "Set Icon value for $keyPath"

# Create the command subkey and set its default value
if (-not (Test-Path $commandKeyPath)) {
    New-Item -Path $commandKeyPath -Force
    Write-Output "Created command subkey: $commandKeyPath"
} else {
    Write-Output "Command subkey already exists: $commandKeyPath"
}

New-ItemProperty -Path $commandKeyPath -Name "(Default)" -Value "`"C:\Users\Francois\Documents\Scripts\Open in Arch WSL.exe`" `"%v`"" -PropertyType String -Force
Write-Output "Set default value for $commandKeyPath"
