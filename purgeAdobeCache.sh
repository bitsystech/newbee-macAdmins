#!/bin/bash

adobeCachePath="/Library/Application Support/Adobe/Common/Media Cache Files"

# Iterate through users
for userHome in /Users/*
do
    if [ ! "${userHome}" = "Shared" ]; then
        if [ -d "${userHome}${adobePath}" ]; then
            # Clear user's Adobe Files
            rm -rf "${userHome}${adobeCachePath}"
        fi
    fi
done