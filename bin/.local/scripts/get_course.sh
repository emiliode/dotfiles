#!/bin/bash 
course=$(cat /home/emil/.local/scripts/courses.txt | rofi -dmenu -no-custom -p ">" -l 8 )
course_id=$(echo $course | tr " " "\n" | tail -n1)

librewolf --new-tab "https://166250.logineonrw-lms.de/course/view.php?id=${course_id}"

