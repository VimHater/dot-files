#!/bin/env bash
set -xe
mkdir -p "$HOME/.config/neovide"
cp -r ./neovide/. "$HOME/.config/neovide/"
cp ./wezterm.lua "$HOME/.wezterm.lua"
mkdir -p "$HOME/.config/niri"
cp -r ./niri/. "$HOME/.config/niri/"
