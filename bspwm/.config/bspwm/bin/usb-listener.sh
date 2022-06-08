#!/usr/bin/env sh

pipe=/tmp/user-udev-stuff

[ ! -e  "$pipe" ] && mkfifo "$pipe"

while true
do
	line=$(cat "$pipe")
	if [[ "$line" == "usb" ]] ; then
		play -v 0.3 /home/emil/.config/bspwm/connect.mp3 &
	fi
done
