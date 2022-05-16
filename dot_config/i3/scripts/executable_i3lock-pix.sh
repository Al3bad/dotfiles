#!/bin/bash

# Colors
DARK=282c34EE
WHITE=ebeaff
GREY=6a7280
BLUE=3c5f7d
BLUE_LIGHT=4d7aa1
RED=e26a72
GREEN=6ac389

# Stop media
playerctl stop
# Set volume to 0
pamixer --set-volume 0

# Create the pixelated image
scrot /tmp/screen.png
convert /tmp/screen.png -scale 2.5% -scale 4000% -brightness-contrast -30x-30 -modulate 100%,50%,100% /tmp/screen.png

# Lock the screen with the pixelated image
i3lock -c 000000 -i /tmp/screen.png --clock --indicator \
        --ring-width 2 --ring-color=$BLUE --ringver-color=$BLUE_LIGHT --ringwrong-color=$RED \
                       --inside-color=$DARK --insidever-color=$DARK --insidewrong-color=$DARK \
                       --keyhl-color=$BLUE_LIGHT \
                       --bshl-color=$RED \
                       --verif-color=$GREY  --wrong-color=$RED  --modif-color=$BLUE \
                       --layout-color=$GREY --time-color=$BLUE  --date-color=$BLUE \
                       --date-str="%a, %d-%m-%Y" \
                       --verif-text="Verifying"
# Delete the temp image
rm /tmp/screen.png



