#!/usr/bin/env bash

pid=$(pgrep -f capslock.sh)
if [[ -n "$pid" ]]; then
    kill "$pid"
fi

pkill swaybg

swaybg -m fill -i ~/backgrounds/sn-wallpaper-dark.png &

~/.config/niri/scripts/kbd_wbar.sh &
sleep 2
~/.config/niri/scripts/capslock.sh &
