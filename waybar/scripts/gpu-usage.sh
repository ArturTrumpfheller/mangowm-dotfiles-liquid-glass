#!/bin/sh

for file in /sys/class/drm/card*/device/gpu_busy_percent; do
    if [ -r "$file" ]; then
        cat "$file"
        exit 0
    fi
done

printf 'N/A\n'
