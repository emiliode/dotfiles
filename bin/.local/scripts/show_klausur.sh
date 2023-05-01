#!/bin/bash

set -euxo pipefail
fach=`printf "IF \n MA \n MaNT" | rofi -dmenu -no-custom -p Fach:`
if [[ $fach == *"IF"* ]]; then
    folder="/home/emil/Schule/Info/IF_x_L_HT_GG"
elif [[ $fach == *"MaNT"* ]]; then 
    folder="/home/emil/Schule/Mathe/t_L_N1_GG"
else
    folder="/home/emil/Schule/Mathe/t_L_HT_GG"
fi
choice=`/bin/ls $folder | rofi -dmenu -no-custom -p Klausur: -l 8`
zathura "$folder/$choice"
# echo $choice |xargs printf -- '$folder/%s' | xargs zathura
# zathura 
# /bin/ls ~/Schule/Info/IF_x_L_HT_GG | dmenu -p Klausur: -l 8 |xargs printf -- '/home/emil/Schule/Info/IF_x_L_HT_GG/%s' | xargs zathura
