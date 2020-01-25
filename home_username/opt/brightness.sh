#!/bin/bash

CTRL_FILE='/sys/class/backlight/intel_backlight/brightness'

case $1 in
	+)  echo $(( $(cat $CTRL_FILE) + 10 )) > $CTRL_FILE ;; 
	-)  echo $(( $(cat $CTRL_FILE) - 10 )) > $CTRL_FILE ;; 
	++) echo $(( $(cat $CTRL_FILE) + 50 )) > $CTRL_FILE ;; 
	--) echo $(( $(cat $CTRL_FILE) - 50 )) > $CTRL_FILE ;; 
	*) echo 'Usage: brightness +|-|++|--' ;;
esac
