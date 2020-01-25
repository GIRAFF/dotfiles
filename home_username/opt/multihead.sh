#!/bin/bash

# The good old script to connect home monitor to laptop.
# TODO technically it's possible to connect any avaliable device automatically
# HINT check arch's Xorg startup scripts

MODE=1280x1024
SIDE=right-of
OUT=VGA1
if [ $# -ge 1 ]
then
	if [ $1 == "kit" ]
	then
		MODE=1920x1080
		SIDE=above
		OUT=HDMI1
	fi
fi
xrandr --output LVDS1 --mode 1366x768 --output $OUT --mode $MODE --$SIDE LVDS1

#xrandr --output VGA1 --preferred --output LVDS1 --off

~/opt/keymap.sh
