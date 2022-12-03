#!/bin/bash 

# This needs special test. Last time we used it was in 2018
LOGGED_USER=`stat -f%Su /dev/console` 
sudo su $LOGGED_USER -c 'defaults delete com.apple.dock persistent-apps' 

dock_item() { 

    printf '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>%s</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>', "$1" 

} 

<app1>=$(dock_item <app1 path>) 
<app2>=$(dock_item <app2 path>) 

sudo su $LOGGED_USER -c "defaults write com.apple.dock persistent-apps -array '$<app1>' '$<app2>'" 
killall Dock 