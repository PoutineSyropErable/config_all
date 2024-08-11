# Define the registry paths
$keyPath = "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\Arch WSL"
$commandKeyPath = "$keyPath\command"

# Output the registry key and value
Write-Output "Reading from: $keyPath"
$registryKey = Get-Item -Path $keyPath -ErrorAction SilentlyContinue

if ($registryKey) {
    Write-Output "Registry Key Exists"
    
    # Extract and display values
    $defaultValue = (Get-ItemProperty -Path $keyPath -Name '(Default)').'(Default)'
    $iconValue = (Get-ItemProperty -Path $keyPath -Name 'Icon' -ErrorAction SilentlyContinue).'Icon'
    
    Write-Output "Default Value: $defaultValue"
    Write-Output "Icon Value: $iconValue"
    
    # Output values from the command subkey
    Write-Output "Reading from command subkey: $commandKeyPath"
    $commandKey = Get-Item -Path $commandKeyPath -ErrorAction SilentlyContinue
    if ($commandKey) {
        $commandValue = (Get-ItemProperty -Path $commandKeyPath -Name '(Default)').'(Default)'
        Write-Output "Command Value: $commandValue"
    } else {
        Write-Output "Command Subkey Does Not Exist"
    }
} else {
    Write-Output "Registry Key Does Not Exist"
}
