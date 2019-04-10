#!/bin/sh
# This script is called by i3 on startup to remap keys.
# Increase key speed via a rate change
xset r rate 300 50
# Map the menu button to right super as well.
xmodmap -e 'keycode 135 = Super_R'
# Left arrow key as Super_R in case PC does not have a Right_super
#xmodmap -e 'keycode 113 = Super_R'
