homepage="www.bitsystechnologies.com" 

 
 

sudo killall -z -m "Safari" -signal 

 
 

# Loop through each user to set homepage prefs 

for user in $(ls /Users | grep -v Shared | grep -v npsparcc | grep -v ".localized"); do 

 
 

### Safari ### 

 
 

# Use defaults command to set Safari homepage 

su - "$user" -c "defaults write com.apple.Safari HomePage $homepage" 

su - "$user" -c "defaults write com.apple.Safari NewWindowBehavior -int 0" 

su - "$user" -c "defaults write com.apple.Safari NewTabBehavior -int 0" 

su - "$user" -c "defaults read com.apple.Safari" 

echo "Set new Safari homepage to $homepage for $user." 

 
 

done 