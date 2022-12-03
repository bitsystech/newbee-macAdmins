#!/bin/sh 
export PATH=/usr/bin:/bin:/usr/sbin:/sbin 
USERNAME= "Daniel" 
FULLNAME= "Daniel.Hector" 
PASSWORD="One@Two#8" 
PASSWORDHINT="One to Eight" 
sysadminctl -addUser "$USERNAME" -fullName "$FULLNAME"  -password "$PASSWORD" -hint "$PASSWORDHINT" -admin 