#!/bin/sh
# This script is meant to be called to change the keyboard between us and us-international

isUs=$(setxkbmap -query | grep -c variant);
# not so strict check since this returns 0 if
# there is no variant
if [ "${isUs}" = "0" ]
then
  setxkbmap -layout us -variant intl
else
  setxkbmap -layout us
fi

# After switch rerun remaps
~/.scripts/tools/remaps.sh
