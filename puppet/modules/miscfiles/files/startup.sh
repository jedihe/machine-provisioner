#!/bin/bash

# General adjustments to be done at session start
# Use by adding to Startup Applications

if ! pgrep redshift; then redshift -l 4.66:-74.09 -t 6500:3500 & fi

# Reset left-handed button mapping for Trackball,
# Unity/Gnome seems to override the .conf file settings for this.
xinput set-button-map "Logitech USB Trackball" 3 2 1
xinput set-prop "Logitech USB Trackball" "Evdev Wheel Emulation Button" 1
