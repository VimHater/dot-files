#!/bin/sh
grim -g "$(slurp)" - | tee "$HOME/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png" | wl-copy
