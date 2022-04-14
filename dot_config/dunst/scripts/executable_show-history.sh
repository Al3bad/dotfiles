#!/usr/bin/env bash

LIMIT="${1:-4}"

dunstctl close-all
for i in $(seq $LIMIT); do
  dunstctl history-pop
done

