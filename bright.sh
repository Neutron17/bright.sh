#!/bin/sh

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <brightness level>" >&2
	exit 1
fi

# if [ read -lt "$1" ]

echo "$1" | sudo tee /sys/class/backlight/amdgpu_bl1/brightness

