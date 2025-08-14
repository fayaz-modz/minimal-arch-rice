#!/usr/bin/env bash

if [[ -f /tmp/kanata_layer ]]; then
    layer=$(cat /tmp/kanata_layer)
    caps="caps"
    if [[ -f /tmp/capslock_status ]]; then
        caps=$(cat /tmp/capslock_status)
    fi
    echo "{\"text\": \"${layer}\", \"alt\": \"${layer}\", \"class\": \"${layer}${caps}\" } "
else
    echo "{\"text\": \"\", \"alt\": \"\"}"
fi
