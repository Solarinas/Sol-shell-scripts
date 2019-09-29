#!/bin/bash

SCREENSHOTS_DIR=~/Pictures/Screenshots
FILENAME=$SCREENSHOTS_DIR/$(date +%F_%H%M%S).png
NOTIFICATION_PICTURE="~/.scripts/gabriel-notification-icons/proxy.duckduckgo.com.jpg"

# Screenshot selection
if [[ "$1" = "-s" ]]; then
    notify-send "Screenshot taken Goshujin-sama~" --urgency low -i $NOTIFICATION_PICTURE 
    maim -o -u -d 1 -s -m 3 $FILENAME
    xclip -selection clipboard -t image/png $FILENAME

# Screenshot active window
elif [[ $1 = "-u" ]]; then
    notify-send "Screenshot taken Goshujin-sama~" --urgency low -i $NOTIFICATION_PICTURE 
    maim -u -d 1 -i $(xdotool getactivewindow) -m 3 $FILENAME
    xclip -selection clipboard -t image/png $FILENAME

# Screenshot primary desktop
elif [[ $1 = "-m" ]]; then
    notify-send "Screenshot taken Goshujin-sama~" --urgency low -i $NOTIFICATION_PICTURE
    maim -u -d 1 -g 1920x1080 -m 3 $FILENAME
    xclip -selection clipboard -t image/png $FILENAME

# Temporary screenshot of whole desktop
elif [ -z "$1" ]; then
    notify-send "Screenshot taken Goshujin-sama~" --urgency low -i $NOTIFICATION_PICTURE
    maim /tmp/screenshot.png 
    xclip -selection clipboard -t image/png /tmp/screenshot.png

# Display error if command fails
else
    notify-send "You made a fucksy wucksy" -i $NOTIFICATION_PICTURE 
fi
