#!/bin/bash

# Defind / find the OS

osVersion=<OS Version>
installerPath="/find/your/own"
majorVersion=$(echo $osVersion | cut -d "." -f 1)
minorVersion=$(echo $osVersion | cut -d "." -f 2)
if [ $majorVersion == "13" ];then
    installerPath="install macOS Ventura.app"
elif [ $majorVersion == "12" ];then
    installerPath="install macOS Monterey.app"
elif [ $majorVersion == "11" ];then
    installerPath="Install macOS Big Sur.app"
elif [ $minorVersion == "15"* ];then
    installerPath="Install macOS Catalina.app"
fi
fullPath="/Applications/$installerPath/Contents/Resources/startosinstall"
softwareupdate --fetch-full-installer –full-installer-version $osVersion

# Find the way for password feedin.