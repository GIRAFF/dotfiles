#!/bin/bash
again=yes
while [ "$again" = "yes" ]
do
	curl --request POST 'http://biz.zabmedia.ru/php/votes.php' --data "p1=81"
	#sleep 1s
done