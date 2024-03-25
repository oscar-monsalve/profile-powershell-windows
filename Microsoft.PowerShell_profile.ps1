# Delete initial PowerShell initial messages
Clear-Host

# Setting UTF8 encoding
$PSDefaultParameterValues['*:Encoding'] = 'utf8'

# Set Oh-My-Posh font
oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/robbyrussell.omp.json' | Invoke-Expression

# fzf
$env:FZF_DEFAULT_COMMAND='fd --type d --hidden --follow --exclude .git'

$env:FZF_DEFAULT_OPTS="--border"

# Custom functions
function fd {
    cd $(fzf)
}

function start_powershell {
    start powershell
}

function onedrive {
    # Change to the D: drive
    Set-Location D:\

    # Specify the target path with encoded "ó" character
    $encodedPath = [System.Text.Encoding]::UTF8.GetString([System.Text.Encoding]::Default.GetBytes(".\OneDrive - Instituto Tecnológico Metropolitano\"))

    # Check if the path already exists
    if (Test-Path $encodedPath) {
        # Change to the target path on the D: drive
        Set-Location $encodedPath
    } else {
        Write-Warning "The specified path does not exist: $encodedPath"
    }
}

# Keyboard shortcuts
Set-PSReadLineKeyHandler -Key "Ctrl+P" -ScriptBlock {start_powershell}
Set-PSReadLineKeyHandler -Key "Ctrl+F" -ScriptBlock {fd}
# Change to D: drive and cd into the onedrive directory
Set-PSReadLineKeyHandler -Key "Ctrl+O" -ScriptBlock {onedrive}


# Set aliases
Set-Alias vim nvim
Set-Alias arduino "~/AppData/Local/Programs/Arduino IDE/Arduino IDE.exe"
