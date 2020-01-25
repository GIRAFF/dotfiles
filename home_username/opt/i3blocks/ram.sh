#num=$(free | grep Mem | awk '{print $3/$2 * 100.0}' | cut -d. -f1)
num=$(conky -t '${memperc}' -i1)

echo RAM $num%
echo ''
echo $([[ $num > 90 ]] && echo '#ff0000' || echo '#ffffff')
