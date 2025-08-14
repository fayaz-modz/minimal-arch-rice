#!/usr/bin/env bash

if [[ -f /tmp/kanata_layer ]]; then
    layer=$(cat /tmp/kanata_layer)
    echo "{\"text\": \"${layer}\", \"alt\": \"${layer}\", \"class\": \"${layer}\" } "
else
    echo "{\"text\": \"\", \"alt\": \"\"}"
fi
