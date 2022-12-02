#!/bin/bash 

#With the power management settings pmset command, we can manage settings like idle sleep timing, wake on administrative access, automatic restart on power loss, etc.
sudo pmset sleep 15  

#This command will set the system sleep timer to 15 minutes i.e., the system will automatically sleep after 15 minutes of inactivity.
sudo pmset displaysleep 15  

#This command will set the display sleep timer to 15 minutes i.e., the system will turn off the device display after 15 minutes of inactivity.
sudo pmset repeat wakeorpoweron MTWRFSU 9:00:00  
