#!/bin/sh

case $BLOCK_BUTTON in
	1) notify-send "<b>🖥 CPU hogs</b>:
$(ps axch -o cmd:15,%cpu --sort=-%cpu | head)" ;;
	3) notify-send "<b>🖥 CPU module:</b>
- Shows CPU temperature.
- Click to show intensive processes.
- % is of single core." ;;
esac

sensors | awk '/Core 0/ {print $3}'
