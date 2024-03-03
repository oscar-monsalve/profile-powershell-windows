# Delete initial PowerShell initial messages
Clear-Host

# Set Oh-My-Posh font
oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/robbyrussell.omp.json' | Invoke-Expression

# fzf
$env:FZF_DEFAULT_COMMAND='fd --type d --hidden --follow --exclude .git'

$env:FZF_DEFAULT_OPTS="--border"

function fd {
    cd $(fzf)
}

# Set aliases
Set-Alias vim nvim
