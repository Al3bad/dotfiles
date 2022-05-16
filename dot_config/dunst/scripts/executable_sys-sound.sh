#!/usr/bin/env bash

APPNAME="$1"
SUMMARY="$2"
FREEDESKTOP_DIR=/usr/share/sounds/freedesktop/stereo
SYSSOUND_DIR=$HOME/Music/system-sounds

# Don't play sound for these notifications
APP_IGNORE=(flameshot Backlight discord Thunderbird Mailspring)
[[ " ${APP_IGNORE[*]} " =~ " ${APPNAME} " ]] && exit 0
# [[ $APPNAME == "flameshot" ]] || [[ $APPNAME == "Backlight" ]] || \
# [[ $APPNAME == "discord" ]] || [[ $APPNAME == "" ]] && exit 0

if [[ $APPNAME == "Volume" ]]; then
  paplay $FREEDESKTOP_DIR/audio-volume-change.oga
else
  paplay "$SYSSOUND_DIR/notification-4.ogg"
fi



