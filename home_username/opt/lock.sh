#!/bin/bash

# "Freeze" screens, waiting for password.

HOME='/home/giraff'

scrot $HOME/.screenshots/lock.png
#/home/giraff/opt/im/watercolor -s 0 -e 5 -m 50 -c 0 $HOME/.screenshots/lock.png $HOME/.screenshots/lock_m.png
i3lock -i /home/giraff/.screenshots/lock.png
#i3lock -u -i /home/giraff/.screenshots/lock.png
