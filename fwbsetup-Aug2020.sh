#!/bin/sh

# Laeeq Humam on Aug 18, 2020
# Created as we had 25 Boosters to be configured
# You will remove these line, anyways

#################################################
# Version 1.0 - Initial commit                  #
# Version 1.1 - Added Log file                  #
# Version 2.0 - Validation if FWB is installed  #
# Change Lines 39, 43, 48 with new version      #
# Version 2.1 - Added checks for fwb process    #
#                                               #
#################################################

# Variables for admtemp account to pass proxy
# Considering you've proxy, else remove 18, 19.
prxyID="$1"
proxyPW="$2"

# Create a log file & give access to all
touch /var/log/fwbsetup.log
chmod 666 /var/log/fwbsetup.log

if [ ! -f /private/var/FWBooster ]; then

# Remove these 7 lines if you don't have proxy in your environment.
# Let the action begin
echo "$(date) - Do you have proxy in your environement?"  | tee -a /var/log/fwbsetup.log >/dev/null
echo "$(date) - Either bypass it at server level"  | tee -a /var/log/fwbsetup.log >/dev/null
echo "$(date) - Or do it at script level"  | tee -a /var/log/fwbsetup.log >/dev/null
# Configure proxy
export http_proxy="http://${prxyID}:${proxyPW}@luluproxy.xws.com:8080"
export https_proxy="http://${prxyID}:${proxyPW}@luluproxy.xws.com:8080"
echo "$(date) - Proxy is configured locally for this script."  | tee -a /var/log/fwbsetup.log >/dev/null
# Get it from FileWave
wget https://fwdl.filewave.com/13.3.1/FileWave_Linux_13.3.1.zip
echo "$(date) - FW installers are	downloaded."  | tee -a /var/log/fwbsetup.log >/dev/null
# Undress it
unzip FileWave_Linux_13.3.1.zip
echo "$(date) - FileWave Installer is unzipped, proceed with installation."  | tee -a /var/log/fwbsetup.log >/dev/null
sleep 5
# Ok, install it
yum install -y --nogpgcheck fwbooster-13.3.1-1.0.x86_64.rpm
echo "$(date) - Booster is installed successfully."  | tee -a /var/log/fwbsetup.log >/dev/null
# Ya well, hope is a good thing but don't just keep hoping

# Confirm if fwbooster is installed by checking process.
FWBPROCESS="fwbooster"
if pgrep -x "$FWBPROCESS" >/dev/null
then
    echo "$(date) - Booster installed, $FWBPROCESS is running ."  | tee -a /var/log/fwbsetup.log >/dev/null
else
    echo "$(date) - Dude! Your booster isn't running. Move your ass and fix it."  | tee -a /var/log/fwbsetup.log >/dev/null
		exit 0

# Write some logs
echo "$(date) - It's time to create symlink but first rename old Data Folder."  | tee -a /var/log/fwbsetup.log >/dev/null
echo "$(date) - WAIT! Stop the Booster first."  | tee -a /var/log/fwbsetup.log >/dev/null
sudo /usr/local/bin/fwcontrol booster stop

# I prefer to keep Data Folder on other disk as a safety measure.
# If you want to do so, keep next 7 lines as it is, else delete them.
# So lets create the folder on other drive. In my case, name of other drive is /data/
mv /private/var/FWBooster/Data\ Folder /private/var/FWBooster/OLDDataFolder
mkdir /data/"Data Folder"
echo "$(date) - Data Folder created on /data disk, proceed with creating symlink."  | tee -a /var/log/fwbsetup.log >/dev/null
# Ok, now create a symlink
ln -s /data/Data\ Folder  /private/var/FWBooster/Data\ Folder
echo "Symlink created."
echo "$(date) - Symlink created."  | tee -a /var/log/fwbsetup.log >/dev/null

# Start the booster now
sudo /usr/local/bin/fwcontrol booster start
echo "$(date) - Server is running now, connect the clients!"  | tee -a /var/log/fwbsetup.log >/dev/null
# Send the log via email to yourself.
mail -a /var/log/fwbsetup.log -s "FWBooster Configure Log" lulu-email-id@xws.com < /dev/null
# If you want fwbooster log file. Check this location on a Linux booster.
mail -a /var/log/fwbooster.log -s "FWBooster Configure Log" lulu-email-id@xws.com < /dev/null
exit 0

	else
	echo "$(date) - Booster is already installed. What do you really want to do here 🤓?"  | tee -a /var/log/fwbsetup.log >/dev/null
    exit 0
fi
