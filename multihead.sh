#!/bin/bash
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
