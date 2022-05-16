#!/usr/bin/bash

LOG_DIR=/var/log/scripts-log/onedrive_sync.log

# Wait for internet connection
while ! ip route | grep -oP "default via .+ dev wlp1s0" &> /dev/null ; do
  sleep 3;
done


onedrive --synchronize 1> $LOG_DIR && {
  # command executed successfully
  notify-send --app-name="OneDrive" "Successfully synced with the cloud!"
} || {
  # error
  notify-send --app-name="OneDrive" "Failed to sync with the cloud. See log in this directory ${LOG_DIR}"
}
