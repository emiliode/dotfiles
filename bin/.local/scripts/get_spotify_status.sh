#!/bin/bash

PARENT_BAR="main"
PARENT_BAR_PID=$(pgrep -a "polybar" | grep "$PARENT_BAR" | cut -d" " -f1)


# Sends $2 as message to all polybar PIDs that are part of $1
update_hooks() {
    while IFS= read -r id
    do
        polybar-msg -p "$id" hook spotify-play-pause $2 1>/dev/null 2>&1
    done < <(echo "$1")
}


STATUS=$(spt pb)

PLAY_PAUSE=${STATUS:0:1}
if [ "$PLAY_PAUSE" = "▶" ]; then 
    update_hooks "$PARENT_BAR_PID" 1
else 
    update_hooks "$PARENT_BAR_PID" 2
fi
OUTPUT=${STATUS:1}
echo $OUTPUT
