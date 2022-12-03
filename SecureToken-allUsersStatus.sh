#!/bin/bash

# Laeeq Humam Tweet@laeeqhumam
# Use a for loop to check list of all users & its ST status.

for user in $(dscl . list /Users UniqueID | awk '$2 >= 500 {print $1}'); do
    sysadminctl -secureTokenStatus "$user" 2>&1 | awk -F'] ' '{print $2}' 
done