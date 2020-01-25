#!/bin/bash

# Shows volume in i3 statusbar when it is changed.
# Hardcore workaround for conky's inflexibility: when you use this script to
# handle amixer's Master volume, you can take volume value from it for about 3
# seconds.

SET_HIVALUE=4
SET_VALUE=1
TMP_FILE='/tmp/vol_sh'
PID_FILE='/tmp/vol_sh_pid'

if [[ $1 == '+' ]] ; then
	amixer set Master $SET_VALUE+
elif [[ $1 == '++' ]] ; then
	amixer set Master $SET_HIVALUE+
elif [[ $1 == '-' ]] ; then
	amixer set Master $SET_VALUE-
elif [[ $1 == '--' ]] ; then
	amixer set Master $SET_HIVALUE-
else
	echo 'Usage: $0 [+|-]'
	exit 1
fi

#echo "Vol: $(amixer get Master | grep 'Front Left:' | cut -d ' ' -f7)" > $TMP_FILE
echo "Vol: $(amixer get Master | grep 'Mono:' | cut -d ' ' -f6)" > $TMP_FILE
pkill -RTMIN+1 i3blocks
echo $$ > $PID_FILE
sleep 3
[[ $(cat $PID_FILE) != $$ ]] && exit
echo '' > $TMP_FILE
pkill -RTMIN+1 i3blocks
