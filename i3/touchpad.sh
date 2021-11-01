#!/bin/bash

DEVICE=14

enabled=$(xinput list-props "$DEVICE" | awk '/^\tDevice Enabled \([0-9]+\):\t[01]/ {print $NF}')
case $enabled in            
  0)
    #enable
    xinput set-prop $(xinput | grep Touchpad | awk '{printf $6}' | cut -b 4-) "Device Enabled" 1
    notify-send Touchpad on
    ;;
  1)
    #disable
    xinput set-prop $(xinput | grep Touchpad | awk '{printf $6}' | cut -b 4-) "Device Enabled" 0
    notify-send Touchpad off
    ;;
  *)
    echo 
    xinput list --name-only
    ;;
esac
