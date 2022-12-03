#!/bin/bash
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.smbd.plist

sleep 5s

sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.smbd.plist