#!/bin/bash

function getId {
	sed 's/.\+id=\([[:digit:]]\+\).\+/\1/' <<< "$1"
}

function getMaster {
	master="$(xinput list | grep 'Virtual core keyboard')"
	echo "$(getId "$master")"
}

function attach {
	echo attaching
	xinput reattach "$(getId "$1")" "$(getMaster)"
}

function detach {
	echo detaching
	xinput float "$(getId "$1")"
	# almost never need a touchpad when there is a mouse attached
	xinput float "$(getId "$(xinput list | grep 'Touchpad')")"
}

status="$(xinput list | grep 'AT Translated')"

grep floating <<< "$status" > /dev/null && attach "$status" || detach "$status"
