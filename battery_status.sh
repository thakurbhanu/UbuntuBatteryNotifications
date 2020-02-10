#!/bin/bash

    while true
    do
        export DISPLAY=:0.0
        battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`

        if on_ac_power; then
            if [ $battery_level -ge 70 ]; then
                notify-send " Battery is charging above 70%." " Please unplug adapter."
             fi
        else
             if [ $battery_level -le 39 ]; then
                notify-send " Battery low. Please plug in the adapter."
             fi
        fi

        sleep 30 # 300 seconds or 5 minutes
    done
