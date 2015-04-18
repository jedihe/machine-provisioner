#!/bin/bash

# General adjustments for jedihe's session
# Use by adding to Startup Applications

# Adjust gamma for SyncMaster to compensate for its darkness
#gnome-terminal --execute `sleep 8 && xgamma -screen 0 -rgamma 1.38 -ggamma 1.40 -bgamma 1.38` &

#gnome-terminal --execute `sleep 4 && disper -r 1920x1080 -e` &
if ! pgrep redshift; then redshift -l 4.66:-74.09 -t 6500:3500 & fi

# Reset left-handed button mapping for Trackball,
# Unity/Gnome seems to override the .conf file settings for this.
xinput set-button-map "Logitech USB Trackball" 3 2 1
xinput set-prop "Logitech USB Trackball" "Evdev Wheel Emulation Button" 1
