# @author: deverebor
# @version: 2.0

# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Modules used
Import-Module posh-git
Import-Module -Name Terminal-Icons
Import-Module PSReadLine

Invoke-Expression (&starship init powershell)

# Auto complete, keybinds and command history
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineOption -HistorySearchCursorMovesToEnd

# Auto sugestions of PSReadline
Set-PSReadlineOption -ShowToolTips
Set-PSReadlineOption -PredictionViewStyle InlineView
Set-PSReadLineOption -PredictionSource History

# Utilities
# Function for finding the path of a given content.
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Function for create venv
function create-venv {
  python '-m' 'venv' '.venv'
  & '.\venv\Scripts\activate'
}

# Function to enter into a venv
function venv {
  & '.\.venv\Scripts\activate'
}

# Alias
Set-Alias ll ls