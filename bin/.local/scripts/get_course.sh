#!/bin/bash 
notify-send "Hello"
course=$(/home/emil/.local/scripts/get_courses.py | dmenu -i -l 8 )
course_id=$(echo $course | tr " " "\n" | tail -n1)

firefox --new-tab "https://166250.logineonrw-lms.de/course/view.php?id=${course_id}"

