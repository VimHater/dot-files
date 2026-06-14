#!/bin/bash
STATE_FILE="/tmp/noctalia-bar-hidden"

if [ -f "$STATE_FILE" ]; then
    qs -c noctalia-shell ipc call bar setDisplayMode always_visible all
    rm "$STATE_FILE"
    sleep 0.5
else
    qs -c noctalia-shell ipc call bar setDisplayMode auto_hide all
    touch "$STATE_FILE"
    sleep 0.5
fi
