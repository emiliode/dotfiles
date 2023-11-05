#!/bin/bash 
course=$(cat /home/emil/.local/scripts/courses.txt | rofi -dmenu -no-custom -p ">" -l 8 )
course_id=$(echo $course | tr " " "\n" | tail -n1)

firefox --new-tab "https://ilias.studium.kit.edu/goto.php?target=${course_id}&client_id=produktiv"
