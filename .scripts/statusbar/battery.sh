#!/bin/sh
# Give a battery name (e.g. BAT0) as an argument.


case $BLOCK_BUTTON in
    3) pgrep -x dunst >/dev/null && notify-send "<b>🔋 Battery module:</b>
🔋: discharging
♻: stagnant charge
🔌: charging
⚡: charged
❗: battery very low!
- Text color reflects charge left" ;;
esac

capacity=$(cat /sys/class/power_supply/BAT0/capacity) || exit
status=$(cat /sys/class/power_supply/BAT0/status)

if [ "$capacity" -ge 75 ]; then
	color="#b8bb26"
elif [ "$capacity" -ge 50 ]; then
	color="#ebdbb2"
elif [ "$capacity" -ge 25 ]; then
	color="#fabd2f"
else
	color="#fb4934"
	warn="❗"
fi
# *.color9: #fb4934
# *.color10: #b8bb26
# *.color11: #fabd2f
# *.color15: #ebdbb2

[ -z $warn ] && warn=" "

# [ "$status" = "Charging" ] && color="#ebdbb2"

# printf "<span color='%s'>%s%s%s</span>" "$color" "$(echo "$status" | sed -e "s/,//g;s/Discharging/🔋/;s/Charging/🔌/;s/Unknown/♻️/;s/Full/⚡/;s/ 0*/ /g;s/ :/ /g")" "$warn" "$(echo "$capacity" | sed -e 's/$/%/')"
printf "%s%s%s" "$(echo "$status" | sed -e "s/,//g;s/Discharging/🔋/;s/Charging/🔌/;s/Unknown/♻️/;s/Full/⚡/;s/ 0*/ /g;s/ :/ /g")" "$warn" "$(echo "$capacity" | sed -e 's/$/%/')"
