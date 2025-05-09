#!/bin/bash

# Get the window ID of the focused node
focused_window=$(bspc query -N -n focused)

[ -z "$focused_window" ] && exit 0

# Get the geometry of the focused window
geometry=$(xwininfo -id "$focused_window" | grep 'Absolute upper-left X\|Absolute upper-left Y\|Width\|Height')

# Extract values
x=$(echo "$geometry" | grep 'Absolute upper-left X' | awk '{print $4}')
y=$(echo "$geometry" | grep 'Absolute upper-left Y' | awk '{print $4}')
width=$(echo "$geometry" | grep 'Width' | awk '{print $2}')
height=$(echo "$geometry" | grep 'Height' | awk '{print $2}')

# Calculate the center position
center_x=$((x + width / 2))
center_y=$((y + height / 2))

# Move the mouse cursor to the center of the focused window
xdotool mousemove "$center_x" "$center_y"

