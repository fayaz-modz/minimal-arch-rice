#!/usr/bin/env bash

pid=$(pgrep -f capslock.sh)
if [[ -n "$pid" ]]; then kill "$pid"; fi
pid_pv=$(pgrep -f phemic_voxtype.sh)
if [[ -n "$pid_pv" ]]; then kill "$pid_pv"; fi
if [[ -n "$pid" ]]; then
    kill "$pid"
fi

pkill swaybg
pkill vicinae
pkill polkit-gnome-authentication-agent-1

swaybg -m fill -i ~/backgrounds/sn-wallpaper-dark.png &
vicinae server &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

~/.config/niri/scripts/kbd_wbar.sh &
sleep 2
~/.config/niri/scripts/capslock.sh &
~/.config/niri/scripts/phemic_voxtype.sh &
