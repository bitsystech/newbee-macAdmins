#!/bin/sh 
# Variable and function declarations 
export PATH=/usr/bin:/bin:/usr/sbin:/sbin 

# Get the currently logged in user 
currentUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ { print $3 }' ) 

# Global check if there is a user logged in 
if [ -z "$currentUser" -o "$currentUser" = "loginwindow" ]; then 
  echo "no user logged in, cannot proceed"  
  exit 1  
fi  

# Get the current user's UID 
uid=$(id -u "$currentUser") 

# Convenience function to run a command as the current user 
runAsUser() {   
  if [ "$currentUser" != "loginwindow" ]; then 
    launchctl asuser "$uid" sudo -u "$currentUser" "$@" 
  else 
    echo "no user logged in" 
    # uncomment the exit command 
    # to make the function exit with an error when no user is logged in 
    # exit 1 
  fi 
} 

# Disable Notification Center 
runAsUser launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 