#!/bin/bash

# Fixes keymap when switch to russian layout breaks.

setxkbmap us,ru
setxkbmap -option grp:alt_shift_toggle
