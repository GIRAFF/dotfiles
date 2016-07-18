#!/bin/bash
if [ $# -lt 2 ] ; then
	echo "Usage: $0 number message"
	exit 1
fi

adb shell am startservice --user 0 -n com.android.shellms/.sendSMS -e contact "$1" -e msg "$2"
