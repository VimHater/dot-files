#!/bin/env bash
set -xe
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p "$HOME/.config"
ln -sfn "$DOTFILES/neovide" "$HOME/.config/neovide"
ln -sfn "$DOTFILES/wezterm.lua" "$HOME/.wezterm.lua"
ln -sfn "$DOTFILES/niri" "$HOME/.config/niri"
