#!/bin/bash

MSGFILE="/home/giraff/msg.txt"

if ! [[ -e $MSGFILE ]] || [[ $(cat $MSGFILE) == '' ]] ; then exit ; fi
echo "<span background=\"white\" foreground=\"black\" weight=\"bold\"> $(cat $MSGFILE)</span>"
