#!/bin/bash

# You can call this script like this:
# $./brightness.sh up
# $./brightness.sh down

function get_brightness {
    brightnessctl -m | tr "," "\n" | sed -n '4p' | cut -d '%' -f 1
}


function send_notification {
    DIR=`dirname "$0"`
    brightness=`get_brightness`
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
#bar=$(seq -s "─" $(($brightness/5)) | sed 's/[0-9]//g')
if [ "$brightness" = "0" ]; then
        icon_name="/usr/share/icons/Faba/48x48/notifications/notification-keyboard-brightness.svg"
        $DIR/notify-send.sh "$brightness""      " -i "$icon_name" -t 2000 -h int:value:"$volume" -h string:synchronous:"─" --replace=555
else
    if [  "$brightness" -lt "10" ]; then
	    icon_name="/usr/share/icons/Faba/48x48/notifications/notification-keyboard-brightness.svg"
        $DIR/notify-send.sh "$brightness""     " -i "$icon_name" --replace=555 -t 2000
    else
        if [ "$brightness" -lt "30" ]; then
            icon_name="/usr/share/icons/Faba/48x48/notifications/notification-keyboard-brightness.svg"
        else
            if [ "$brightness" -lt "70" ]; then
                icon_name="/usr/share/icons/Faba/48x48/notifications/notification-keyboard-brightness.svg"
            else
                icon_name="/usr/share/icons/Faba/48x48/notifications/notification-keyboard-brightness.svg"
            fi
        fi
    fi
fi
bar=$(seq -s "─" $(($brightness/5)) | sed 's/[0-9]//g')
# Send the notification
$DIR/notify-send.sh "$brightness""     ""$bar" -i "$icon_name" -t 2000 -h int:value:"$brightness" -h string:synchronous:"$bar" --replace=555

}
set -x
case $1 in
    up)
	# Up the brightness (+ 5%)
    brightnessctl set +5% > /dev/null
	send_notification
	;;
    down)
	# lower the brightness (- 5%)
    brightnessctl set 5%- > /dev/null
	send_notification
	;;
esac
