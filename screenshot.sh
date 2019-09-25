#!/bin/sh

SCREENSHOTS_DIR=~/Pictures/Screenshots
FILENAME=$SCREENSHOTS_DIR/$(date +%F_%H%M%S).png


# Screenshot selection
if [[ "$1" = "-s" ]]; then
    maim -o -u -d 1 -s -m 3 $FILENAME

# Screenshot active window
elif [[ $1 = "-u" ]]; then
    maim -u -d 1 -i $(xdotool getactivewindow) -m 3 $FILENAME

# Screenshot primary desktop
elif [[ $1 = "-m" ]]; then
    maim -u -d 1 -g 1920x1080 -m 3 $FILENAME

# Temporary screenshot of whole desktop
else
    maim /tmp/screenshot.png 
    xclip -selection clipboard -t image/png /tmp/screenshot.png
fi
    
    
