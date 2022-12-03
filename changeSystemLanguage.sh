#!/bin/bash 

  

CURRENT_USER=`stat -f%Su /dev/console` 

   

#Change system language 

sudo su $CURRENT_USER -c "defaults write -g AppleLanguages -array de en " 