#!/bin/sh   
# Create a new user with the username New user   
sudo dscl . -create /Users/New\ user  

# Add the display name of the User as John Doe   
sudo dscl . -create /Users/New\ user RealName "Pappu Rangeela"  

# Replace password_here with your desired password to set the password for this user  
sudo dscl . -passwd /Users/New\ user password_here  

# (Optional)Add a password hint   
sudo dscl . -create /Users/New\ user hint “Password Hint”  

# (Optional)Add a profile picture   
sudo dscl . -create /Users/New\ user picture “/path to picture.png”  

# Set the Unique ID for New user. Replace with a number that is not already taken.   
sudo dscl . -create /Users/New\ user UniqueID 1088  

# Set the group ID for the user  
sudo dscl . -create /Users/New\ user PrimaryGroupID 20  

# Set the shell interpreter to Bash for New\ user   
sudo dscl . -create /Users/New\ user UserShell /bin/bash  

# Create a Home folder for the user  
sudo dscl . -create /Users/New\ user NFSHomeDirectory /Local/Users/New\ user  

# Append the User with admin privilege. If this line is not included the user will be set as standard user. 
sudo dscl . -append /Groups/admin GroupMembership New\ user  