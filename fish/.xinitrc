#!/bin/bash

#for dwm
# exec dwm

# this is for qtile and watch script maybe
# while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
# 			do
# 			sleep 1
# 			done &
# 			exec qtile
# 			exec watch

# Startup script but everything important is in bspwmrc
systemctl --user import-environment DISPLAY
exec bspwm

