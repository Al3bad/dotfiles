#!/usr/bin/bash

SCREENSHOTS_PATH="$HOME/Pictures/screenshots"
SCREENSHOT_ID=$(date +%s)
NOTIFICATION_MSG="Screenshot is ready\!"

#################################################
# --> If directory doesn't exits, create one
#################################################
if [[ ! -d $SCREENSHOTS_PATH ]]
then
  mkdir -p $SCREENSHOTS_PATH
fi

#################################################
# --> Functions
#################################################
full_screenshot () {
  scrot -e "notify-send -a 'Scort' ' ' '$NOTIFICATION_MSG'" \
        -f $SCREENSHOTS_PATH/$SCREENSHOT_ID.png
}

rectangular_screenshot () {
  scrot -l mode=edge -s -b \
        -e "notify-send -a 'Scort' ' ' '$NOTIFICATION_MSG'" \
        -f $SCREENSHOTS_PATH/$SCREENSHOT_ID.png
}

#################################################
# --> Execute a function based on
#################################################
while getopts 'fs' flag; do
  case "${flag}" in
    f) full_screenshot ;;
    s) rectangular_screenshot ;;
  esac
done
