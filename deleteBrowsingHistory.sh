#!/bin/sh

LOGGED_USER=`stat -f%Su /dev/console` 
sudo su $LOGGED_USER -c 'rm -R /Users/<user name>/Library/Application\ Support/Google/Chrome/Default/History' 
sudo su $LOGGED_USER -c 'rm -R /Users/<user name>/Library/Application\ Support/ Firefox/Profiles' 

