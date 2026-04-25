#!/bin/sh
if [ "$(fcitx5-remote)" = "1" ]; then
    echo 'en'
elif [ "$(fcitx5-remote)" = "2" ]; then
    echo 'vi'
fi
