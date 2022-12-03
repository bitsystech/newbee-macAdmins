#!/bin/bash

### Easy Access Delete commands
# sudo find /private/var/folders/*/*/C/com.apple.mdworker.bundle -mindepth 1 -delete
# sudo find /private/var/folders/*/*/C/com.apple.metadata.mdworker -mindepth 1 -delete

direct1=$(sudo find /private/var/folders/*/*/C/com.apple.metadata.mdworker -type d 2>/dev/null | wc -l | tr -d ' ')
direct2=$(sudo find /private/var/folders/*/*/C/com.apple.mdworker.bundle -type d 2>/dev/null | wc -l | tr -d ' ')
sum=$(( $direct1 + $direct2 ))
MINIMUM=20000

if [[ $sum -ge $MINIMUM ]]; then
	if sudo find /private/var/folders/*/*/C/com.apple.mdworker.bundle -mindepth 1 -delete; then
    echo "Files removed from /private/var/folders/*/*/C/com.apple.mdworker.bundle"
  else
    echo "Error trying to remove files..."
    exit 1
  fi
  if sudo find /private/var/folders/*/*/C/com.apple.metadata.mdworker -mindepth 1 -delete; then
    echo "Files removed from /private/var/folders/*/*/C/com.apple.metadata.mdworker"
  else
    echo "Error removing files..."
    exit 1
  fi
  exit 0
else
  echo "Will not remove files... Minimum file count of $MINIMUM not reached."
  exit 1
fi