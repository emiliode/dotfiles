#!/usr/bin/env sh 

if [[ -p /tmp/user-udev-stuff ]]; then
	su user -c 'echo usb > /tmp/user-udev-stuff'
fi  
