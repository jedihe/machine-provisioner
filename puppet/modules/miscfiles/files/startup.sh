#!/bin/bash

# General adjustments to be done at session start
# Use by adding to Startup Applications

if ! pgrep redshift; then redshift -l 4.66:-74.09 -t 6500:3500 & fi
