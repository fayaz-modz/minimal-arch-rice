#!/bin/sh
sleep 1
pkill -f xdg-desktop-portal-hyprland
pkill -f xdg-desktop-portal
/usr/lib/xdg-desktop-portal-hyprland &
sleep 2
/usr/lib/xdg-desktop-portal &
