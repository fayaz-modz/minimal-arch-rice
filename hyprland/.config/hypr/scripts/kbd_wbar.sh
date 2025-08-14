#!/usr/bin/env bash

pkill kanata

pkill waybar; waybar &

~/.cargo/bin/kanata -c ~/.config/hypr/keymaps/full.kbd 2>&1 \
  | grep --line-buffered "(deflayer " \
  | awk '{print $2; fflush()}' \
  | while read -r layer; do
      echo "$layer" > /tmp/kanata_layer
      kill -RTMIN+5 $(pidof waybar)  # refresh the module
    done
