#!/bin/sh

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <brightness level>" >&2
	exit 1
fi

dir=(/sys/class/backlight/*)

birghtness="$dir/brightness"
max_brightness="255"

while read line; do
	max_brightness="$line"
done < "$dir/max_brightness"

if [ $max_brightness -lt "$1" ]; then
	echo "Too high number, max brightness is $max_brightness"
	exit 2
fi

echo "$1" | sudo tee /sys/class/backlight/amdgpu_bl1/brightness

