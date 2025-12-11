#!/usr/bin/env bash

pkill kanata

pkill waybar; waybar &

~/.cargo/bin/kanata -c ~/.config/niri/keymaps/full.kbd --nodelay 2>&1 \
  | grep --line-buffered "(deflayer " \
  | awk '{print $2; fflush()}' \
  | while read -r layer; do
      echo "$layer" > /tmp/kanata_layer
      kill -RTMIN+5 $(pidof waybar)  # refresh the module
    done
