LOGGED_USER=`stat -f%Su /dev/console` 
sudo su $LOGGED_USER -c 'defaults delete com.apple.dock' 
killall Dock 