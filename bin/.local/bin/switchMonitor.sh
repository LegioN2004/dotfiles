#!/bin/sh
 
case "$1" in
    DP) xrandr --output DP-1 --primary --mode 1366x768 --output HDMI-1 --off ;;
    HDMI) xrandr --output HDMI-1 --primary --mode 1366x768 --output DP-1 --off ;;
    DUAL-left) xrandr --output DP-1 --primary --mode 1366x768 --output HDMI-1 --mode 1366x768 --left-of DP-1 ;;
    DUAL-right) xrandr --output DP-1 --primary --mode 1366x768 --output HDMI-1 --mode 1366x768 --right-of DP-1 ;;
    *) printf '%s\n' "You must provide an argument: DP, HDMI , DUAL-left or DUAL-right " ;;
esac


