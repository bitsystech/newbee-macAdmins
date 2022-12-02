#!/bin/zsh

sudo dscl . -passwd /Users/New\ user oldpassword newpassword

# You can also try sysadminctl now, its a better command. Search other script where sysadminctl is used.


# sysadminctl 
#    -deleteUser <user name> [-secure || -keepHome] (interactive || -adminUser <administrator user name> -adminPassword <administrator password>)
#	-newPassword <new password> -oldPassword <old password> [-passwordHint <password hint>]
#	-resetPasswordFor <local user name> -newPassword <new password> [-passwordHint <password hint>] (interactive] || -adminUser <administrator user name> -adminPassword <administrator password>)
#	-addUser <user name> [-fullName <full name>] [-UID <user ID>] [-GID <group ID>] [-shell <path to shell>] [-password <user password>] [-hint <user hint>] [-home <full path to home>] [-admin] [-roleAccount] [-picture <full path to user image>] (interactive] || -adminUser <administrator user name> -adminPassword <administrator password>)
#	-secureTokenStatus <user name>
#	-secureTokenOn <user name> -password <password> (interactive || -adminUser <administrator user name> -adminPassword <administrator password>)
#	-secureTokenOff <user name> -password <password> (interactive || -adminUser <administrator user name> -adminPassword <administrator password>)
#	-guestAccount <on || off || status>
#	-afpGuestAccess <on || off || status>
#	-smbGuestAccess <on || off || status>
#	-automaticTime <on || off || status>
#	-filesystem status
#	-screenLock <status || immediate || off || seconds> -password <password>