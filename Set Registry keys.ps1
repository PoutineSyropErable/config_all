# Function to set registry key
function Set-RegistryKey {
    param (
        [Parameter(Mandatory = $true)]
        [string]$KeyPath,

        [Parameter(Mandatory = $true)]
        [string]$DefaultValue,

        [Parameter(Mandatory = $false)]
        [string]$IconValue,

        [Parameter(Mandatory = $false)]
        [string]$CommandValue
    )

    # Create the main registry key
    if (-not (Test-Path $KeyPath)) {
        New-Item -Path $KeyPath -Force | Out-Null
        Write-Output "Created registry key: $KeyPath"
    } else {
        Write-Output "Registry key already exists: $KeyPath"
    }

    # Set the default value for the main key
    New-ItemProperty -Path $KeyPath -Name "(Default)" -Value $DefaultValue -PropertyType String -Force
    Write-Output "Set default value for $KeyPath"

    # Set the Icon value if it exists
    if ($IconValue) {
        New-ItemProperty -Path $KeyPath -Name "Icon" -Value $IconValue -PropertyType String -Force
        Write-Output "Set Icon value for $KeyPath"
    }

    # Set the command subkey if CommandValue is provided
    if ($CommandValue) {
        $CommandKeyPath = "$KeyPath\command"
        if (-not (Test-Path $CommandKeyPath)) {
            New-Item -Path $CommandKeyPath -Force | Out-Null
            Write-Output "Created command subkey: $CommandKeyPath"
        } else {
            Write-Output "Command subkey already exists: $CommandKeyPath"
        }
        New-ItemProperty -Path $CommandKeyPath -Name "(Default)" -Value $CommandValue -PropertyType String -Force
        Write-Output "Set command value for $CommandKeyPath"
    }
}

# Define settings for each registry key

# Anaconda Prompt
Set-RegistryKey -KeyPath "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\Anaconda Prompt" `
    -DefaultValue "Open in Anaconda Prompt" `
    -IconValue "C:\\Users\\Francois\\Documents\\Icons\\Anaconda.ico" `
    -CommandValue "`"C:\\Users\\Francois\\Documents\\Scripts\\Open in Anaconda Prompt.bat`" `%V`"

# Arch WSL
Set-RegistryKey -KeyPath "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\Arch WSL" `
    -DefaultValue "Open in Arch WSL" `
    -IconValue "C:\\Users\\Francois\\Documents\\Icons\\arch_linux_icon.ico" `
    -CommandValue "`"C:\\Users\\Francois\\Documents\\Scripts\\Open in Arch WSL.exe`" `%v`"

# Git GUI
Set-RegistryKey -KeyPath "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\git_gui" `
    -DefaultValue "Open Git &GUI here" `
    -IconValue "C:\\Program Files\\Git\\cmd\\git-gui.exe" `
    -CommandValue "`"C:\\Program Files\\Git\\cmd\\git-gui.exe`" `--working-dir`" `%v.`"

# Open in PowerShell
Set-RegistryKey -KeyPath "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\Open in PowerShell" `
    -DefaultValue "Open in Powershell" `
    -IconValue "`"%SystemRoot%\\system32\\WindowsPowerShell\\v1.0\\powershell.exe`"" `
    -CommandValue "`"C:\\Users\\Francois\\Documents\\Scripts\\Open in Powershell.bat`" `%V`"

# VSCode
Set-RegistryKey -KeyPath "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\VSCode" `
    -DefaultValue "Open with VS Code" `
    -IconValue "C:\\Users\\Francois\\Documents\\Icons\\vscode_icon.ico" `
    -CommandValue "`"C:\\Program Files\\Microsoft VS Code\\Code.exe`" `%V`"
