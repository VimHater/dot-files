$ErrorActionPreference = "Stop"
Set-PSDebug -Trace 1

New-Item -ItemType Directory -Force -Path "$env:LOCALAPPDATA/neovide" | Out-Null
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE/AppData/Roaming/neovide/"
Copy-Item -Recurse -Force ./neovide/* "$env:USERPROFILE/AppData/Roaming/neovide/"
Copy-Item -Force ./wezterm.lua "$env:USERPROFILE/.wezterm.lua"
