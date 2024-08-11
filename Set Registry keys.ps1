# Define the base path for the registry keys
$baseRegistryPath = "HKCR:\Directory\Background\shell"

# Function to add a registry key and set its properties
function Add-RegistryKey {
    param (
        [string]$keyPath,
        [string]$defaultValue = "",
        [string]$iconPath = "",
        [string]$command = ""
    )

    # Create the key if it doesn't exist
    if (-not (Test-Path $keyPath)) {
        New-Item -Path $keyPath -Force
    }

    # Set the default value if provided
    if ($defaultValue -ne "") {
        Set-ItemProperty -Path $keyPath -Name "(Default)" -Value $defaultValue
    }

    # Set the icon path if provided
    if ($iconPath -ne "") {
        Set-ItemProperty -Path $keyPath -Name "Icon" -Value $iconPath
    }

    # Set the command if provided
    if ($command -ne "") {
        $commandKeyPath = "$keyPath\command"
        if (-not (Test-Path $commandKeyPath)) {
            New-Item -Path $commandKeyPath -Force
        }
        Set-ItemProperty -Path $commandKeyPath -Name "(Default)" -Value $command
    }
}

# Add the registry entries based on the provided data

# Anaconda Prompt
Add-RegistryKey -keyPath "$baseRegistryPath\Anaconda Prompt" `
                -defaultValue "Open in Anaconda Prompt" `
                -iconPath "C:\Users\Francois\Documents\Icons\Anaconda.ico" `
                -command "`"C:\Users\Francois\Documents\Scripts\Open in Anaconda Prompt.bat`" `"%V`""

# Arch WSL
Add-RegistryKey -keyPath "$baseRegistryPath\Arch WSL" `
                -defaultValue "Open in Arch WSL" `
                -iconPath "C:\Users\Francois\Documents\Icons\arch_linux_icon.ico" `
                -command "`"C:\Users\Francois\Documents\Scripts\Open in Arch WSL.exe`" `"%v`""

# Git GUI
Add-RegistryKey -keyPath "$baseRegistryPath\git_gui" `
                -defaultValue "Open Git &GUI here" `
                -iconPath "C:\Program Files\Git\cmd\git-gui.exe" `
                -command "`"C:\Program Files\Git\cmd\git-gui.exe`" `"--working-dir`" `"%v.`""

# Open in PowerShell
Add-RegistryKey -keyPath "$baseRegistryPath\Open in PowerShell" `
                -defaultValue "Open in PowerShell" `
                -iconPath "`"%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe`"" `
                -command "`"C:\Users\Francois\Documents\Scripts\Open in PowerShell.bat`" `"%V`""

# VSCode
Add-RegistryKey -keyPath "$baseRegistryPath\VSCode" `
                -defaultValue "Open with Code" `
                -iconPath "C:\Users\Francois\AppData\Local\Programs\Microsoft VS Code\Code.exe" `
                -command "`"C:\Users\Francois\AppData\Local\Programs\Microsoft VS Code\Code.exe`" `"%V`""



Read-Host -Prompt "Press Enter to exit"
