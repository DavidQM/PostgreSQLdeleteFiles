#!/bin/bash
filename='SisUsuario.txt'
n=1
while read line; do
	#IFS='|'	read -ra ADDR <<< "$line"
	#reading each line
	#echo "Line No. $n : $line"
	#echo $line | cut -d'|' -f1
	k="$(echo $line | cut -d'|' -f1)"
	echo "$k"
	n=$((n+1))
done < $filename
