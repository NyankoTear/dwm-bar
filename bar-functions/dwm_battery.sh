#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
	# Change BAT0 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)
    
    if [ "$STATUS" = "Charging" ]; then
	    STATUS="C"
    elif [ "$STATUS" = "Discharging" ]; then
	    STATUS="D"
    elif [ "$STATUS" = "Full" ]; then
	    STATUS="F"
    elif [ "$STATUS" = "Not charging" ]; then
	    STATUS="NC"
    else
	   STATUS="$STATUS"
    fi

    printf "%s" "$SEP1"
    printf "BAT %s%% %s" "$CHARGE" "$STATUS"
    printf "%s\n" "$SEP2"
}

dwm_battery

