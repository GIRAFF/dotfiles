#!/bin/bash

[[ $(ps -e | grep audacious | wc -l) == 0 ]] && exit
#[[ $(ps -e | grep qmmp | wc -l) == 0 ]] && exit

IFS='%'
POSTFIX='  '
MAXLEN=48
SONGFILE='/tmp/player_sh_song'
DISPFILE='/tmp/player_sh_disp'

stat=''
case "$(audtool playback-status)" in
#case "$(qmmp --no-start --status | head -n1)" in
	*playing*) stat='>' ;;
	*paused*) stat='||' ;;
	*stopped*) stat='=' ;;
esac

! [[ -e $SONGFILE ]] && touch $SONGFILE 
! [[ -e $DISPFILE ]] && touch $DISPFILE 

song=$(audtool current-song)
#song=$(qmmp --no-start --nowplaying "%p - %t")
disp="$song"
if [[ ${#song} -gt $MAXLEN ]] ; then
	disp=$(cat $DISPFILE)

	if [[ "$(cat $SONGFILE)" == "$song" ]] ; then
		disp="$(echo ${disp:1:${#disp}}${disp:0:1})"
		echo "$disp" > $DISPFILE
	else
		echo "$song" > $SONGFILE
		echo "$song$POSTFIX" > $DISPFILE
		disp="$song$POSTFIX"
	fi
fi

echo "$stat ${disp:0:$MAXLEN} [$(audtool current-song-output-length)]"
#echo "$stat ${disp:0:$MAXLEN} [$(qmmp --no-start --status | head -n1 | cut -d' ' -f3 | cut -d'/' -f1)]"

unset IFS
