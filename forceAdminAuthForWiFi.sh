#!/bin/zsh 

#!/usr/local/bin/airport 

sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport 

/usr/local/bin/airport -s 

sudo /usr/local/bin/airport prefs JoinMode=Preferred RequireAdminIBSS=YES RequireAdminPowerToggle=YES RequireAdminNetworkChange=YES 