#!/bin/bash

set -euxo pipefail
choice=`/bin/ls ~/Schule/Mathe/t_L_HT_GG | rofi -dmenu -p Klausur: -l 8`
echo $choice |xargs printf -- '/home/emil/Schule/Mathe/t_L_HT_GG/%s' | xargs zathura
# /bin/ls ~/Schule/Info/IF_x_L_HT_GG | dmenu -p Klausur: -l 8 |xargs printf -- '/home/emil/Schule/Info/IF_x_L_HT_GG/%s' | xargs zathura
