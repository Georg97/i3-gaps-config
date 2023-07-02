#!/bin/bash

i3status -c $HOME/.config/i3/i3status/config | while :
do
    read line
    output=$(grep -Po '(?<=gtk-application-prefer-dark-theme=).*' $HOME/.config/gtk-4.0/settings.ini)
    dark='NaN'
    if [ "$output" = "1" ]; then 
        dark='dark'
    elif [ "$output" = "0" ]; then 
        dark='light'
    fi
    LG=$(setxkbmap -query | awk '/layout/{print $2}') 
    VARIANT=$(setxkbmap -query | awk '/variant/{print $2}')
    if [ -n "$VARIANT" ]; then
        LG="$LG ($VARIANT)"
    fi
    echo "LG: $LG | $dark theme  | $line" || exit 1
done

