#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# for dwm
# exec dwm
# exec i3

# this is for qtile and watch script maybe
# while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
# 			do
# 			sleep 1
# 			done &
# 			exec qtile
# 			exec watch

# Startup script but everything important is in bspwmrc
# systemctl --user import-environment display
# exec bspwm

