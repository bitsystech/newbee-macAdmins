#!/bin/bash 

currentUser=`ls -l /dev/console | cut -d " " -f 4` 

ext_dir="/Users/$currentUser/Library/Application Support/Google/Chrome/Default/Extensions/" 

for i in $(find "$ext_dir" -name 'manifest.json'); do   

     # n=$(grep -hIr name $i| cut -f4 -d '"'| sort) 

     # u="https://chrome.google.com/extensions/detail/" 

  ue=$(basename $(dirname $(dirname $i))) 

  echo "$ue,$n:\n$update\n" 

Done 