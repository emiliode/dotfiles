#!/bin/bash 

active_window=$(hyprctl activewindow) 
pos=${active_window/*at:/}
pos=${pos/size*/}
pos=$(echo $pos| tr -d '\n')
size=${active_window/*size:/}
size=${size/workspace*/}
size=${size/,/x}
size=$(echo $size| tr -d '\n')
echo "$pos $size"
