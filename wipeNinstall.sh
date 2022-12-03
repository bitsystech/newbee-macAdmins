#!/bin/bash 

  

installerFileName=$(ls /Applications/ | grep "Install macOS") 

cpuNameIntel=$(system_profiler SPHardwareDataType 2>/dev/null | awk -F ": " '/Processor Name/ {print $NF}') 

cpuNameApple=$(system_profiler SPHardwareDataType 2>/dev/null | awk -F ": " '/Chip/ {print $NF}') 

macOSVersion=$(sw_vers -productVersion) 

macOSMajor=$(sw_vers -productVersion | cut -d '.' -f1) 

macOSMinor=$(sw_vers -productVersion | cut -d '.' -f2) 

macOSName=$(awk '/SOFTWARE LICENSE AGREEMENT FOR macOS/' '/System/Library/CoreServices/Setup Assistant.app/Contents/Resources/en.lproj/OSXSoftwareLicense.rtf' | awk -F 'macOS ' '{print $NF}' | awk '{print substr($0, 0, length($0)-1)}') 

  
password=$1 

currentUser=$2 


if [ -z $currentUser ]; then  

currentUser=$(scutil <<< "show State:/Users/ConsoleUser" | awk '/Name :/ && ! /loginwindow/ { print $3 }') 

fi 

 
if [ $macOSMajor -eq 10 ] && [ $macOSMinor -lt 15 ]; then 

echo "This script supports only 10.15 or higher" 

exit 0 

fi 


if [[ $installerFileName == "" ]] ; then 

  

if [ $macOSMajor -eq 10 ] && [ $macOSMinor -eq 15 ]; then 

softwareupdate --fetch-full-installer --full-installer-version "10.15.7" 

fi 

installerFileName=$(ls /Applications/ | grep "Install macOS") 

  

if [ "$installerFileName" == "" ] && [ $macOSMajor -eq 10 ] ; then 

echo "Catalina is no longer supported" 

fi 

if [ $macOSMajor -gt 10 ] ; then 

macOSVersion=$(softwareupdate --list-full-installers | grep "$macOSName" |  head -n 1 | awk -F'Version:' '{print $2}' |  awk '{print $1;}' | tr -d ,) 

softwareupdate --fetch-full-installer --full-installer-version $macOSVersion 

installerFileName=$(ls /Applications/ | grep "Install macOS") 

fi 

  

fi 

  

if [ -z "$cpuNameApple" ] && [ $macOSMajor -eq 10 ]; then 

if [ -z "$currentUser" ]; then 

echo "Current user cannot be found. Exiting program." 

exit 1 

fi 

  

"/Applications/$installerFileName/Contents/Resources/startosinstall" --eraseinstall --agreetolicense --nointeraction 

  

elif [ -n "$cpuNameApple" ] || [ $macOSMajor -gt 10 ]; then 

  
if [ -z "$password" ]; then 

echo "This macOS device has a Apple Processor or is on Big Sur or newer. Please rerun shell script with a admin password appended" 

echo "Usage: sh simpleEraseInstall.sh {admin_password} {admin_user}\n" 

echo "Note: You can omit {admin_user} flag if expected admin is logged in. \n" 

exit 1 

fi 
 

if [ -z "$currentUser" ]; then 

echo "This macOS device has a Apple Processor or is on Big Sur or newer. Please rerun shell script with a admin password appended." 

echo "Usage: sh simpleEraseInstall.sh {admin_password} {admin_user}\n" 

echo "Note: You can omit {admin_user} flag if expected admin is logged in. \n" 

exit 1 

fi 

  	/usr/bin/expect <<EOF 

set timeout -1 

set password ${password} 

spawn {/Applications/$installerFileName/Contents/Resources/startosinstall} --eraseinstall --allowremoval --agreetolicense --nointeraction --forcequitapps --passprompt --user {$currentUser} 

expect "By using the agreetolicense option, you are agreeing that you have run this tool with the license only option and have read and agreed to the terms.\r\nIf you do not agree, press CTRL-C and cancel this process immediately.\r\nPassword: " 

send "$password\r" 

expect 

EOF 

  
else 

  echo "Could not verify if device is a Apple Product" 

fi 

#set timeout 3600  