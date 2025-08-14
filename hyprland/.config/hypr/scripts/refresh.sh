#!/usr/bin/env bash

notify-send 'refreshing env'

hyprctl reload
pkill waybar

waybar &
~/.config/hypr/scripts/remaps.sh &
