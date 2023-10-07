#!/bin/bash

killall polybar

if type "xrandr";then
	for m in $(xrandr --query | grep "connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload okiban &
	done
else
	polybar --reload okiban &
fi
