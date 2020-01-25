info=$(acpi | grep '^Battery 0' | cut -d: -f2-)
prefix=$(echo "$info" | cut -d, -f1)
percent=$(echo "$info" | cut -d, -f2)
remain=''

if ! [[ $prefix == ' Full' ]] ; then
	indicator=$([[ $(echo $info | cut -d' ' -f4-) == 'until charged' ]] \
		&& echo '+ ' || echo '')
	remain=" $indicator$(echo $info | cut -d' ' -f3)"
fi

# workaround for ACPI
[[ $remain == ' until' ]] && remain='';

echo "Bat:$percent$remain"
echo "Bat:$percent"
echo $([[ $(echo "$percent" | sed 's/ \(.*\)%/\1/')  < 10 ]] && echo '#ff0000'\
	|| echo '#ffffff')
