#!/usr/bin/env bash

APPNAME="$1"
SUMMARY="$2"
FREEDESKTOP_DIR=/usr/share/sounds/freedesktop/stereo
SYSSOUND_DIR=$HOME/Music/system-sounds

# Don't play sound for these notifications
[[ $APPNAME == "flameshot" ]] || [[ $APPNAME == "Backlight" ]] || \
[[ $APPNAME == "discord" ]] && exit 0

if [[ $APPNAME == "Volume" ]]; then
  paplay $FREEDESKTOP_DIR/audio-volume-change.oga
else
  paplay "$SYSSOUND_DIR/notification-4.ogg"
fi



