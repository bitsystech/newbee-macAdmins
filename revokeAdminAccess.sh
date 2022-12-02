#!/bin/sh 
USERNAME=$1 
sudo dseditgroup -o edit -d "$USERNAME" -t user admin 
errcode=$? 
if [ "$errcode" -ne 0 ]; 
then 
echo "" 
echo "Failed"
echo "" 
exit 1 
fi 
echo "Admin rights revoked for user $USERNAME"  
