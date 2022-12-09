#!/bin/bash

# Created by BitSys Technologies for a client in Sweden.
# Tweet @BitSysAB
# This script to send an email to the DL if FileWave backup exists.
# The script sends the basic info like file size & name. It can have more information if needed.

# Set the directory and filename
# In your case the directory can be different, check your backup script to see where is the backup getting saved

directory='/data/DataFolder/Backup/'
formattedate=$(date +%b-%d-%y)
filefullname=$(fwxserver-Config-DB-${formattedate}*.tar.gz)
filename$(echo "${filefullname:0:29}")

# Check if the file exists in the specified directory
if [ -f "$directory$filename" ]; then
    # Get the file size
    fileSize=$(stat -c%s "$directory$filename")

    # Send the email using the mail command
    mail -s "Backup Exists: $filename" lh@bst.com <<EOF
The file "$filename" was found in the directory "$directory" with a size of $fileSize bytes.
EOF
else 
# Send the email using the mail command
    mail -s "Backup ERROR: $filename" lh@bst.com <<EOF
Your script sucks, fix it soon else you wont know whats happening in the backup folder!!!.
EOF
fi
