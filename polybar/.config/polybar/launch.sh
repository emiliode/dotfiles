#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# Launch the bar



moncount=$(xrandr --query | grep " connected" | wc -l)

if [ $moncount -eq 2 ]
then
    MONITOR="HDMI-A-0" polybar -q main -c "$DIR"/config.ini &
    MONITOR="eDP" polybar -q second -c "$DIR"/config.ini &
else 
    MONITOR="eDP" polybar -q main -c "$DIR"/config.ini & 
fi
