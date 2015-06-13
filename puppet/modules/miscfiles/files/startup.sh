#!/bin/bash

# General adjustments to be done at session start
# Use by adding to Startup Applications

if ! pgrep redshift; then redshift -l 4.66:-74.09 -t 6500:3500 & fi

# Make the whole surface perform a left click on press
xinput set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Soft Button Areas" 0, 0, 0, 0, 0, 0, 0, 0
