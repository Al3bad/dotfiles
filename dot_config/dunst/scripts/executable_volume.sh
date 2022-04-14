#!/usr/bin/env bash

# Show mute notification if the mute is activated
VOL=$(pamixer --get-mute)
if [ $VOL == "true" ]; then
  ICON=audio-volume-muted-symbolic
  dunstify "MUTE" -a "Volume" -h string:x-dunst-stack-tag:volume -i $ICON
  exit 0
fi

VOL=$(pamixer --get-volume)

# Select the proper icon based on the volume lvl
if [ $VOL -ge 70 ]; then
  ICON=audio-volume-high-symbolic
elif [ $VOL -ge 40 ]; then
  ICON=audio-volume-medium-symbolic
elif [ $VOL -gt 0 ]; then
  ICON=audio-volume-low-symbolic
elif [ $VOL -eq 0 ]; then
  ICON=audio-volume-muted-symbolic
else
  ICON=audio-volume-high-symbolic
fi

# Show the volume lvl notification
dunstify "$VOL%" -a "Volume" -h "int:value:$VOL" -h string:x-dunst-stack-tag:volume -i $ICON
