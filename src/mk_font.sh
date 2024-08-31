#!/usr/bin/env bash

if [ -d fonts ]; then
        rm -r fonts
fi

# Declare associative array for color mapping
declare -A colors
colors=(
    ["#cdd6f4"]="Mocha"
    ["#cad3f5"]="Macchiato"
    ["#c6d0f5"]="Frappé"
    ["#4c4f69"]="Latte"
)


declare -A colors_inv
colors_inv=(
    ["#cdd6f4"]="true"
    ["#cad3f5"]="true"
    ["#c6d0f5"]="true"
    ["#4c4f69"]="false"
)



mkdir -p fonts
y_pos=-3
for font in  "inter.ttf" "RobotoMono-Regular.ttf"; do
    for col in "#cdd6f4" "#cad3f5" "#c6d0f5" "#4c4f69"; do

        mkdir -p "fonts/${colors[$col]}"
        for size in  14 16 18 28 30 32 42 44 46; do
            ./font2png.sh -f $font -s $size -c $col -i ${colors_inv[$col]} -y $y_pos "fonts/${colors[$col]}/${font,,}-$size.png"
        done
    done
done

exit 0
