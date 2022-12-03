#!/bin/sh  
# Create a new user with the username Sharing user 
sudo dscl . create /Users/Sharing\ user     
# Give the display name of the user as David 
sudo dscl . create /Users/Sharing\ user RealName "David" 
# (Optional) Add a password hint 
sudo dscl . create /Users/Sharing\ user hint "123456" 
# (Optional) Set a profile picture. 
sudo dscl . create /Users/Sharing\ user picture "/Provide path to the image.png" 
# Replace “123456” with the required password for the user account. 
sudo dscl . passwd /Users/Sharing\ user 123456 
# Set the unique ID for the user. Provide an ID which is not already used. 
sudo dscl . create /Users/Sharing\ user UniqueID 550     
# Set the Group ID for the user 
sudo dscl . create /Users/Sharing\ user PrimaryGroupID 20     
# Deny shell access for the user 
sudo dscl . create /Users/Sharing\ user UserShell /usr/bin/false   
# No home directory for the user   
sudo dscl . create /Users/Sharing\ user NFSHomeDirectory /dev/null     