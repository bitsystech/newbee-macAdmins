#!/bin/zsh

# Laeeq Humam Tweet@laeeqhumam
# This will list all profiles with name.
system_profiler SPConfigurationProfileDataType | grep "Name:" | awk '{print $1, $2,$3,$4,$5}' | sort -u