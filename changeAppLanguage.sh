#!/bin/bash 
CURRENT_USER=`stat -f%Su /dev/console` 
# Change app language 
sudo su $CURRENT_USER -c "defaults write -app Calendar AppleLanguages -array de" 