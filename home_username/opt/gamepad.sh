#!/bin/bash

# When Defender Scorpion is connected it starts xboxdrv, so you can use it to play.
# TODO maybe possible to bind it with incron

# is it for DVTech pad?
#xboxdrv --evdev /dev/input/by-id/usb-Microntek_USB_Joystick-event-joystick --evdev-absmap ABS_X=x1,ABS_Y=y1,ABS_RZ=x2,ABS_Z=y2,ABS_HAT0X=dpad_x,ABS_HAT0Y=dpad_y --axismap -Y1=Y1,-Y2=Y2 --evdev-keymap BTN_TOP=x,BTN_TRIGGER=y,BTN_THUMB2=a,BTN_THUMB=b,BTN_BASE3=back,BTN_BASE4=start,BTN_BASE=lb,BTN_BASE2=rb,BTN_TOP2=lt,BTN_PINKIE=rt,BTN_BASE5=tl,BTN_BASE6=tr --mimic-xpad --silent &

device=$(lsusb | grep "Defender Wireless Controller")
xboxdrv --device-by-path $(echo "$device" | awk '{print $2}'):$(echo "$device" | awk '{print $4}' | sed -e 's/\://') --type xbox360 --silent
