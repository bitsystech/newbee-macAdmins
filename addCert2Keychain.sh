curl –O Provide the URL and the certificate_name to download the certificate here 

sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain /Users/certificate_name 

/usr/bin/security authorizationdb write system.preferences <<EndOfPlist 

<?xml version="1.0" encoding="UTF-8"?> 

<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"> 

<plist version="1.0"> 

<dict> 

<key>allow-root</key> 

<true/> 

<key>authenticate-user</key> 

<true/> 

<key>class</key> 

<string>user</string> 

<key>comment</key> 

<string>Checked by the Admin framework when making changes to certain System Preferences.</string> 

<key>group</key> 

<string>techs</string> 

<key>session-owner</key> 

<false/> 

<key>shared</key> 

<true/> 

</dict> 

</plist> 

EndOfPlist 