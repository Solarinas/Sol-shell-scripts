#!/bin/bash

SCREENSHOTS_DIR=~/Pictures/Screenshots
FILENAME=$SCREENSHOTS_DIR/$(date +%F_%H%M%S).png

function after_screenshot {
    ICON="$HOME/.emacs.d/GabEmacs2.png"

    notify-send "Screenshot taken Goshujin-sama~" --urgency low -i "$ICON"
    xclip -selection clipboard -t image/png "$FILENAME"
}

if [ -s "$1" ]; then
    maim -o -u -d 1 -s -m 3 "$FILENAME"
    after_screenshot
elif [ -u "$1" ]; then
    maim -u -d 1 -i "$(xdotool getactivewindow)" -m 3 "$FILENAME"
    after_screenshot
elif [ -m "$1" ]; then
    maim -u -d 1 -g 1920x1080 -m 3 "$FILENAME"
    after_screenshot
elif [ -z "$1" ]; then
    maim /tmp/screenshot.png
    after_screenshot
fi
