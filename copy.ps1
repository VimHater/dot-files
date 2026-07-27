$ErrorActionPreference = "Stop"
Set-PSDebug -Trace 1

$Dotfiles = $PSScriptRoot

New-Item -ItemType SymbolicLink -Force -Path "$env:USERPROFILE/AppData/Roaming/neovide" -Target "$Dotfiles/neovide" | Out-Null
New-Item -ItemType SymbolicLink -Force -Path "$env:USERPROFILE/.wezterm.lua" -Target "$Dotfiles/wezterm.lua" | Out-Null
