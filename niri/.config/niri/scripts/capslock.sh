#!/usr/bin/env bash
set -euo pipefail

LED_PATH=$(ls -d /sys/class/leds/*::capslock 2>/dev/null | head -n1)
if [[ -z "${LED_PATH:-}" ]]; then
  exit 1
fi

last=""
while :; do
  val=$(cat "$LED_PATH/brightness")
  status=$([ "$val" = "1" ] && echo "caps" || echo "nocaps")
  if [[ "$status" != "$last" ]]; then
    echo "$status" > /tmp/capslock_status
    last="$status"
    kill -RTMIN+5 $(pidof waybar)  # refresh the module
  fi
  sleep 0.1
done
