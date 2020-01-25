#!/bin/bash
# Copyright (C) 2014 Julien Bonjean <julien@bonjean.info>
# Copyright (C) 2014 Alexander Keller <github@nycroth.com>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

#------------------------------------------------------------------------

# Use the provided interface, otherwise the device used for the default route.
IF=$(ip route | awk '/^default/ { print $5 ; exit }')
[[ $IF == '' ]] && exit

#------------------------------------------------------------------------

# As per #36 -- It is transparent: e.g. if the machine has no battery or wireless
# connection (think desktop), the corresponding block should not be displayed.
[[ ! -d /sys/class/net/${IF} ]] && exit

#------------------------------------------------------------------------

if [[ "$(cat /sys/class/net/$IF/operstate)" = 'down' ]]; then
  echo '' # full text
  echo '' # short text
  echo \#FF0000 # color
  exit
fi

case $1 in
  -4)
    AF=inet ;;
  -6)
    AF=inet6 ;;
  *)
    AF=inet6? ;;
esac

# if no interface is found, use the first device with a global scope
IPADDR=$(ip addr show $IF | perl -n -e "/$AF ([^\/]+).* scope global/ && print \$1 and exit")

case $BLOCK_BUTTON in
  3) echo -n "$IPADDR" | xclip -q -se c ;;
esac

#------------------------------------------------------------------------
prefix="$(echo ${IF:0:1} | awk '{print toupper($0)}'): "

quality=''
if [[ ${IF:0:1} == 'w' ]] ; then
	#[[ ! -d /sys/class/net/${IF}/wireless ]] ||
		#[[ "$(cat /sys/class/net/$IF/operstate)" = 'down' ]] && exit

	quality="$(grep $IF /proc/net/wireless | \
		awk '{ print int($3 * 100 / 70) }')"

	# color
fi

qstr=$([[ ${IF:0:1} == 'w' ]] && echo " $quality%" || echo '')

echo "$prefix$IPADDR$qstr" # full text
echo "$prefix$IPADDR$qstr" # short text
if [[ ${IF:0:1} != 'w' ]] || [[ $quality -ge 60 ]]; then
	echo "#00FF00"
elif [[ $quality -lt 40 ]]; then
	echo "#FF0000"
else
	echo "#FFFF00"
fi
