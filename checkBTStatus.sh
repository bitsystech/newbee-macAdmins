#!/bin/bash
touch '/Library/LaunchAgents/com.app_name.plist'
cat > /Library/LaunchAgents/com.app_name.plist <<EOF

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>KeepAlive</key>
	<false/>
	<key>Label</key>
	<string>com.app_name.plist</string>
	<key>Program</key>
	<string>/System/Applications/app_name.app/Contents/MacOS/app_name</string>
	<key>RunAtLoad</key>
	<true/>
</dict>
</plist>