$ErrorActionPreference = "Stop"
Set-PSDebug -Trace 1

Copy-Item -Recurse -Force ./neovide "$env:LOCALAPPDATA/neovide"
Copy-Item -Force ./wezterm.lua "$env:USERPROFILE/.wezterm.lua"
