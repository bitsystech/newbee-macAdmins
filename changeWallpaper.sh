path="$1" 
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "'"$path"'"' 
ret=$? 
if [ $ret == "0" ]; then 
echo "Wallpaper set successfully " 
else 
echo "Operation failed." 
fi 