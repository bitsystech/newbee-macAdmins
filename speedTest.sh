#!/bin/bash

# Laeeq Humam Tweet@laeeqhumam
# Speed test. Nowhere on the internet, took like 2hrs to figure out.
# Only option availbae online is speedtest-cli 

curl -w "Type: %{content_type}\nSpeed: %{speed_download}\n"   -o /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip