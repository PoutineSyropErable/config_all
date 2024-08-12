# Define the paths for executables and icons
$anacondaPath = "C:\Users\Francois\Documents\Scripts\Open in Anaconda Prompt.bat"
$archWslPath = "C:\Users\Francois\Documents\Scripts\Open in Arch WSL.exe"
$gitGuiPath = "C:\Program Files\Git\cmd\git-gui.exe"
$powershellPath = "C:\Users\Francois\Documents\Scripts\Open in Powershell.bat"
$vsCodePath = "C:\Users\Francois\AppData\Local\Programs\Microsoft VS Code\Code.exe"
$anacondaIcon = "C:\Users\Francois\Documents\Icons\Anaconda.ico"
$archWslIcon = "C:\Users\Francois\Documents\Icons\arch_linux_icon.ico"
$gitGuiIcon = "C:\Program Files\Git\cmd\git-gui.exe"
$powershellIcon = "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe"

# Define the registry key paths and icons
$baseKeys = @(
    @{ Path = "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\Anaconda Prompt"; Command = "`"$anacondaPath`" `"%V`"" ; Icon = $anacondaIcon },
    @{ Path = "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\Arch WSL"; Command = "`"$archWslPath`" `"%v`"" ; Icon = $archWslIcon },
    @{ Path = "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\git_gui"; Command = "`"$gitGuiPath`" `--working-dir` `"%v`"" ; Icon = $gitGuiIcon },
    @{ Path = "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\Open in PowerShell"; Command = "`"$powershellPath`" `"%V`"" ; Icon = $powershellIcon },
    @{ Path = "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\VSCode"; Command = "`"$vsCodePath`" `"%V`"" ; Icon = $vsCodePath }
)

# Create registry keys and set values
foreach ($entry in $baseKeys) {
    $baseKeyPath = $entry.Path
    $commandKeyPath = "$baseKeyPath\command"

    # Create the base key
    New-Item -Path $baseKeyPath -Force | Out-Null
    Set-ItemProperty -Path $baseKeyPath -Name "(Default)" -Value ("Open in " + [System.IO.Path]::GetFileNameWithoutExtension($entry.Path))
    
    # Set the icon
    Set-ItemProperty -Path $baseKeyPath -Name "Icon" -Value $entry.Icon
    
    # Create the command key
    New-Item -Path $commandKeyPath -Force | Out-Null
    Set-ItemProperty -Path $commandKeyPath -Name "(Default)" -Value $entry.Command
}

Write-Output "Context menu entries added successfully."
