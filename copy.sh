#!/bin/env bash
set -xe
mkdir -p "$HOME/.config/neovide"
cp -r ./neovide/. "$HOME/.config/neovide/"
cp ./wezterm.lua "$HOME/.wezterm.lua"
mkdir -p "$HOME/.config/niri"
cp -r ./niri/. "$HOME/.config/niri/"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
cp ./.zshrc "$HOME/.zshrc"
cp ./.zprofile "$HOME/.zprofile"
