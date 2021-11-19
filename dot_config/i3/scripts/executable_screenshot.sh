#!/usr/bin/bash

SCREENSHOTS_PATH="$HOME/Pictures/screenshots"

# If directory doesn't exits, create one
if [[ ! -d $SCREENSHOTS_PATH ]]
then
  mkdir -p $SCREENSHOTS_PATH
fi

# Take screenshot
scrot $SCREENSHOTS_PATH/$(date +%s).png
