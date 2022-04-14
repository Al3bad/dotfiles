#!/usr/bin/env bash

BRIGHTNESS=$(printf %i $(echo "$(xbacklight -get)"))

dunstify "$BRIGHTNESS%" -a "Backlight" -h "int:value:$BRIGHTNESS" -h string:x-dunst-stack-tag:backlight -i display-brightness-symbolic
