#!/bin/sh
cd $HOME/.wallpaper/comp/
image=$(find $HOME/.wallpaper/comp -type f -name '*.jpg' -o -name '*.png' | shuf -n 1)
#echo $image
feh --bg-scale "$image"
