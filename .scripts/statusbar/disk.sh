#!/bin/sh

# Status bar module for disk space
# $1 should be drive mountpoint
# $2 is optional icon, otherwise mountpoint will displayed

[ -z "$1" ] && exit

icon="$2"
[ -z "$2" ] && icon="$1"

case $BLOCK_BUTTON in
	1) pgrep -x dunst >/dev/null && notify-send "<b>💽 Disk space:</b>
$(df -h --output=target,used,size)" ;;
	3) pgrep -x dunst >/dev/null && notify-send "<b>💽 Hard drive space remaining:</b>
- Shows used hard drive space.
- Click to show all disk info." ;;
esac

printf "%s: %s" "$icon" "$(df -h "$1" | awk ' /[0-9]/ {print $3 "/" $2}')"
