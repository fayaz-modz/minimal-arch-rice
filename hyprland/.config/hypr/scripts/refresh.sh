#!/usr/bin/env bash

notify-send 'refreshing env'

pid=$(pgrep -f capslock.sh)
if [[ -n "$pid" ]]; then
    kill "$pid"
fi

~/.config/hypr/scripts/kbd_wbar.sh &
~/.config/hypr/scripts/capslock.sh &
