#!/bin/bash

SCREENSHOTS_DIR=~/Pictures/Screenshots
FILENAME=$SCREENSHOTS_DIR/$(date +%F_%H%M%S).png
#COWBOY="~/.emacs.d/GabEmacs2.png"

function after_screenshot {
    COWBOY="$HOME/.emacs.d/GabEmacs2.png"

    notify-send "Screenshot taken Goshujin-sama~" --urgency low -i "$COWBOY"
    xclip -selection clipboard -t image/png "$FILENAME"
}

if [[ "$1" = "-s" ]]; then
    maim -o -u -d 1 -s -m 3 "$FILENAME"
    after_screenshot
elif [[ $1 = "-u" ]]; then
    maim -u -d 1 -i "$(xdotool getactivewindow)" -m 3 "$FILENAME"
    after_screenshot
elif [[ $1 = "-m" ]]; then
    maim -u -d 1 -g 1920x1080 -m 3 "$FILENAME"
    after_screenshot
elif [ -z "$1" ]; then
    maim /tmp/screenshot.png
    after_screenshot
else
    notify-send "You made a fuck wucky" -i "$COWBOY"
fi
