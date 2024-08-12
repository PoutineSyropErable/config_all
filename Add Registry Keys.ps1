
# Define the paths for executables and icons
$anacondaPath = "C:\Users\Francois\Documents\Scripts\Open in Anaconda Prompt.bat"
$archWslPath = "C:\Users\Francois\Documents\Scripts\Open in Arch WSL.exe"
$gitGuiPath = "C:\Program Files\Git\cmd\git-gui.exe"
$powershellPath = "C:\Users\Francois\Documents\Scripts\Open in Powershell.bat"
$vsCodePath = "C:\Users\Francois\AppData\Local\Programs\Microsoft VS Code\Code.exe"
$adminPowershellPath = "C:\Users\Francois\Documents\Scripts\Open in Powershell Admin.bat"

$anacondaIcon = "C:\Users\Francois\Documents\Icons\Anaconda.ico"
$archWslIcon = "C:\Users\Francois\Documents\Icons\arch_linux_icon.ico"
$gitGuiIcon = "C:\Program Files\Git\cmd\git-gui.exe"
$powershellIcon = "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe"
$vsCodeIcon = "C:\Users\Francois\AppData\Local\Programs\Microsoft VS Code\Code.exe"

# Define the registry key paths and icons
$baseKeys = @(
    @{ Name = "Open in Anaconda Prompt"; Path = "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\Anaconda Prompt"; Command = "`"$anacondaPath`" `"%V`"" ; Icon = $anacondaIcon },
    @{ Name = "Open in Arch WSL"; Path = "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\Arch WSL"; Command = "`"$archWslPath`" `"%v`"" ; Icon = $archWslIcon },
    @{ Name = "Open Git GUI Here"; Path = "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\git_gui"; Command = "`"$gitGuiPath`" `--working-dir` `"%v`"" ; Icon = $gitGuiIcon },
    @{ Name = "Open in PowerShell"; Path = "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\Open in PowerShell"; Command = "`"$powershellPath`" `"%V`"" ; Icon = $powershellIcon },
    @{ Name = "Open in VSCode"; Path = "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\VSCode"; Command = "`"$vsCodePath`" `"%V`"" ; Icon = $vsCodeIcon },
    @{ Name = "Open in Powershell (Admin)"; Path = "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\OpenPowershellAdmin"; Command = "`"$adminPowershellPath`" `"%V`"" ; Icon = $powershellIcon }
)

# Create registry keys and set values
foreach ($entry in $baseKeys) {
    $baseKeyPath = $entry.Path
    $commandKeyPath = "$baseKeyPath\command"

    # Create the base key
    New-Item -Path $baseKeyPath -Force | Out-Null
    Set-ItemProperty -Path $baseKeyPath -Name "(Default)" -Value $entry.Name
    
    # Set the icon
    Set-ItemProperty -Path $baseKeyPath -Name "Icon" -Value $entry.Icon
    
    # Create the command key
    New-Item -Path $commandKeyPath -Force | Out-Null
    Set-ItemProperty -Path $commandKeyPath -Name "(Default)" -Value $entry.Command
}

Write-Output "Context menu entries added successfully."
