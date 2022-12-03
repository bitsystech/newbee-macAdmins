#!/bin/sh
killall -HUP mDNSResponder && dscacheutil -flushcache