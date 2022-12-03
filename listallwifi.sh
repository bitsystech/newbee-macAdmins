#!/bin/sh

# ValueAdd to remove Wi-Fi Guest
# First find it
# Second, Custom Field using script in FW
# Third, Deploy Script to remove this WiFi
# Suicide 

# Later in next phase check if Guest is connected. Dont kill, talk to the user
# But this can be done in the same script

# Its great way to do it because only affected Macs will get it.

wifiiname=$(networksetup -listallhardwareports | awk '/Wi-Fi/{getline; print $2}')

OLD_IFS="$IFS"
IFS=","
echo $((networksetup -listpreferredwirelessnetworks $wifiiname) | egrep 'PRINT|LAEEQ')
IFS="$OLD_IFS"
