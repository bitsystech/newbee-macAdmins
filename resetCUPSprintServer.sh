#!/bin/bash

### Reset cupsd files and service
cupsConf="/etc/cups/cupsd.conf"
printersConf="/etc/cups/printers.conf"
cupsDefault="/etc/cups/cupsd.conf.default"
cupsBackup="/etc/cups/cupsd.conf.backup"
printersBackup="/etc/cups/printers.conf.backup"

# Stop the cups daemon
sudo launchctl stop org.cups.cupsd

# Remove configured printers
while read printer; do
    echo "Deleting Printer:" $printer
    lpadmin -x $printer
done < <(lpstat -p | awk '{print $2}')

# Rename the old CUPS configuration file
if [ -e "${cupsConf}" ]; then
    sudo mv "${cupsConf}" "${cupsBackup}"
else
    echo "Error: cups.conf not found at ${cupsConf}" 1>&2
fi

# Restore the default settings file
if [ -e "${cupsDefault}" ]; then
    sudo cp "${cupsDefault}" "${cupsConf}"
else
    echo "Error: cupsd.default file not found at ${cupsDefault}" 1>&2
fi

# Rename the printers file
if [ -e "${printersConf}" ]; then
    sudo mv "${printersConf}" "${printersBackup}" 
else
    "Error: printers.conf file not found at ${printersConf}" 1>&2
fi

# Restart the cups daemon
sudo launchctl start org.cups.cupsd